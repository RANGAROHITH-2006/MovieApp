import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/favoritemovie.dart';

class Myfavorite extends ConsumerWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritemovie = ref.watch(favoritemoviesProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
                icon: FaIcon(FontAwesomeIcons.userCircle, color: Colors.white),
                onPressed: () {
                  context.push('/accounts_screen');
                },
              ),
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 252, 250, 250),
                ),
                color: Colors.grey[900],
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        onTap: () {
                          context.push('/telugu');
                        },
                        child: Text(
                          'Telugu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.push('/hindi');
                        },
                        child: Text(
                          'Hindi',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.push('/english');
                        },

                        child: Text(
                          'English',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          context.push('/mymovies');
                        },

                        child: Text(
                          'MyMovies',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
              ),
            ],
          ),
        ],
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.black,
      body: favoritemovie.when(
        data: (movies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'My Favorites',
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
                              'No favorite movies',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ),
                ),
              ],
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
