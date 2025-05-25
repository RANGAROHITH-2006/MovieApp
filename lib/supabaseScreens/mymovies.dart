import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/mymoviedprovider.dart';
import 'package:movieapp/supabaseScreens/addmoviepage.dart';

class MyMovies extends ConsumerWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mymovie = ref.watch(MymoviesProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        actions: [
          Column(
            children: [
              Row(
               
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
                   TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddMoviePage()),
                      );
                    },
                    child:Text ('Add Movie',style: TextStyle(fontSize: 15,color: Colors.red),),
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
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.black,
      body: mymovie.when(
        data: (movies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Movies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child:
                movies.isNotEmpty
                    ? GridView.builder(
                      itemCount: movies.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    )
                    : const Center(
                      child: Text(
                        'No movie in MyMovies',
                        style: TextStyle(fontSize: 16,color: Colors.red),
                      ),
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
