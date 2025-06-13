import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/hindiprovider.dart';


class HindiMovieScreen extends ConsumerWidget {
  const HindiMovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telugumovies = ref.watch(hindimoviesProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 0, 
        title: TextButton(
          onPressed: (){
            context.push('/home_Screen');
          },
          child: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )),
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
      backgroundColor: Colors.black,
      body: telugumovies.when(
        data: (movies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hindi Movies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
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
          )]));
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
