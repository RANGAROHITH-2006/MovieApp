import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';

import 'package:movieapp/providers/supabaseprovider/mymoviedprovider.dart';

class AddMoviePage extends ConsumerStatefulWidget {
  const AddMoviePage({super.key});

  @override
  ConsumerState<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends ConsumerState<AddMoviePage> {
  final titleController = TextEditingController();
  final imageController = TextEditingController();
  final videoController = TextEditingController();
  final overviewController = TextEditingController();
  final genreController = TextEditingController();

  void submit() async {
    final movie = {
      'title': titleController.text,
      'image': imageController.text,
      'video': videoController.text,
      'overview': overviewController.text,
      'genre': genreController.text,
    };

    try {
      await MovieServices.addMyMovie(movie);
      ref.refresh(MymoviesProvider);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Movie added to MyMovies')));
      Navigator.pop(context);
    } catch (e) {
      print('Error adding movie: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error adding movie')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 0, 
        title: TextButton(
          onPressed: () {
            context.go('/home_Screen');
          },
          child: Text(
            'Movies',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        actions: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.push('/searchInput');
                    },
                    icon: Icon(Icons.search, color: Colors.white, size: 25),
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.userCircle,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.push('/accounts_screen');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: videoController,
              decoration: const InputDecoration(labelText: 'Video URL'),
            ),
            TextField(
              controller: overviewController,
              decoration: const InputDecoration(labelText: 'Overview'),
            ),
            TextField(
              controller: genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    imageController.text.isNotEmpty &&
                    videoController.text.isNotEmpty) {
                  if (imageController.text.isNotEmpty &&
                      Uri.tryParse(imageController.text)?.hasAbsolutePath ==
                          true) {
                    submit();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill Valid Image url')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in Title, Image, and Video'),
                    ),
                  );
                }
              },
              child: const Text('Add Movie'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
