import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/searchprovider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final moviesAsync = ref.watch(searchedMoviesProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        titleSpacing: 0, 
        title: TextButton(
          onPressed: (){
            context.go('/home_Screen');
          },
          child: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/myfavorite');
            },
            icon: Icon(Icons.favorite, color: Colors.white, size: 30),
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
                    child: Text('Hindi', style: TextStyle(color: Colors.white)),
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value.trim();
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search your movie',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child:
                query.isEmpty
                    ? const Center(
                      child: Text(
                        'Search your movie',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                    : moviesAsync.when(
                      data: (movies) {
                        if (movies.isEmpty) {
                          return const Center(
                            child: Text(
                              'No movie found',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ListTile(
                                title: Text(
                                  movie['title'] ?? '',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading:
                                    movie['image'] != null
                                        ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.network(
                                            movie['image'],
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                        : const Icon(
                                          Icons.movie,
                                          color: Colors.white,
                                        ),
                                onTap: () {
                                  context.push(
                                    '/detailspage/${Uri.encodeComponent(movie['image'])}/${Uri.encodeComponent(movie['title'])}/${Uri.encodeComponent(movie['overview'])}/${Uri.encodeComponent(movie['video'])}',
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Center(
                            child: Text(
                              'Error: $error',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                    ),
          ),
          SocialMedia()
        ],
      ),
    );
  }
}
