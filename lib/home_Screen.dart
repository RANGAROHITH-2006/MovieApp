import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage.dart';
import 'package:movieapp/Screens/detailedpages/detailspage2.dart';
import 'package:movieapp/Screens/detailedpages/static/movies_list.dart';
import 'package:movieapp/Screens/detailedpages/static/movies_section.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:movieapp/providers/supabaseprovider/latestmoviesprovider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestMoviesAsync = ref.watch(latestMoviesProvider);
    final popularMoviesAsync = ref.watch(popularMoviesProvider);
    
    final overview =
        "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";
        
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Movies',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/searchInput');
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
          IconButton(
            onPressed: () {
              context.push('/myfavorite');
            },
            icon: Icon(Icons.favorite, color: Colors.white, size: 30),
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
                  PopupMenuItem(
                    onTap: () {
                      context.push('/accounts_screen');
                    },
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items:
                    [
                      {
                        "title": "Interstellar",
                        "url": "https://wallpapercave.com/wp/wp11717725.jpg",
                        "video":
                            "https://youtu.be/zSWdZVtXT7E?si=pTwEGtmc9mTbaxz9",
                      },
                      {
                        "title": "Avengers",
                        "url":
                            "https://i.pinimg.com/474x/14/ff/e7/14ffe7140918f60d7220071df408ea4d.jpg",
                        "video":
                            "https://youtu.be/6ZfuNTqbHE8?si=BqxP605BmQQgYR9K",
                      },
                      {
                        "title": "Avatar 2",
                        "url":
                            "https://slm-assets.secondlife.com/assets/31681849/lightbox/Avatar-The%20Way%20of%20Water.jpg?1655049012",
                        "video":
                            "https://youtu.be/1f65r8BUZ5I?si=YgjxbRRefEWwFG7w",
                      },
                      {
                        "title": "Dune 2",
                        "url":
                            "https://m.media-amazon.com/images/I/71cS3aGfH0L.jpg",
                        "video":
                            "https://youtu.be/Way9Dexny3w?si=TGxT6DobWJsGTAka",
                      },
                    ].map((movie) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              context.push(
                                '/detailspage/${Uri.encodeComponent(movie['url']!)}/${Uri.encodeComponent(movie['title']!)}/${Uri.encodeComponent(overview)}/${Uri.encodeComponent(movie['video']!)}',
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image.network(
                                    movie['url']!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Container(
                                    color: Colors.black54,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 15.0,
                                    ),
                                    child: Text(
                                      movie['title']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
              // Latest Movies Section
              latestMoviesAsync.when(
                data: (latestMovies) => MoviesSection(
                  title: 'Latest Movies',
                  movies: latestMovies,
                  onMovieTap: (movie) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailspage(
                          movie['image'] ?? '',
                          movie['title'] ?? '',
                          movie['overview'] ?? '',
                          movie['video'] ?? '',
                        ),
                      ),
                    );
                  },
                ),
                loading: () => Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Error loading latest movies: $error',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              // Popular Movies Section  
              popularMoviesAsync.when(
                data: (popularMovies) => MoviesSection(
                  title: 'Popular Movies',
                  movies: popularMovies,
                  onMovieTap: (movie) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailspage2(
                          movie['image'] ?? '',
                          movie['title'] ?? '',
                          movie['overview'] ?? '',
                          movie['video'] ?? '',
                        ),
                      ),
                    );
                  },
                ),
                loading: () => Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Error loading popular movies: $error',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              MoviesSection(
                title: 'Most Watched',
                movies: originalMovies,
                onMovieTap: (movie) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Detailspage(
                            movie['image'] ?? '',
                            movie['title'] ?? '',
                            movie['overview'] ?? '',
                            movie['video'] ?? '',
                          ),
                    ),
                  );
                },
              ),
              SocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
