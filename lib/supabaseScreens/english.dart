import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/englishprovider.dart';



class EnglishMovieScreen extends ConsumerWidget {
  const EnglishMovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telugumovies = ref.watch(englishmoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchInput()),
                      );
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
      backgroundColor: Colors.black,
      body: telugumovies.when(
        data: (movies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                      '/detailspage/${Uri.encodeComponent(movie.image)}/${Uri.encodeComponent(movie.title)}/${Uri.encodeComponent(movie.overview)}/${Uri.encodeComponent(movie.video)}',
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      movie.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
