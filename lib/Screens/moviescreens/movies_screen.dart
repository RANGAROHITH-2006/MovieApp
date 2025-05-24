import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';

import 'package:movieapp/providers/treanding_provider.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treandMovie = ref.watch(movieProvider);
    // List<String> Movies = [
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvw_eAfmPc1_Rt0sp4001xJn6MGfx1DrwK7cnO5q72QBnmCWe34D33zbWaIVtySjADoU&usqp=CAU",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7kpYmCNQ_YNsms4z-uwfw9JOOR5lCpBDQgrUSLX24RfjMAGJfpNLe-fOolXX1zzO5_8A&usqp=CAU",
    //   "https://images.hindustantimes.com/img/2024/08/17/1600x900/Kalki_2898_AD_OTT_release_1723868283514_1723868283753.jpg",
    //   "https://i.ytimg.com/vi/36W_9rsUH7E/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAF1gtaLX01Q65NXUJnpM7mEGM4Ew",
    //   "https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/medium/bhairavam-et00418461-1730806159.jpg",
    //   "https://img.youtube.com/vi/8ZscPPpEWPo/maxresdefault.jpg",
    //   "https://i.ytimg.com/vi/roX7EqczsUs/maxresdefault.jpg",
    //   "https://i.ytimg.com/vi/DMgh2alw4u8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBYHXmg5AKLxFaYkArRg54smx5Omg",
    //   "https://thetelugufilmnagar.com/storage/2024/02/AMAran-Featured.webp",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBnyg8e6YWWCyTwrJmUSNLRqUg_IuJRq-Wg&s",
    //   "https://images.filmibeat.com/img/2025/04/newproject-2025-04-12t093816-894-1744431922.jpg",
    //   "https://i.ytimg.com/vi/WcIZblqc2e8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBjrfwImOHXfIhrbplrQ9OyzwA61Q",
    // ];
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
      body: treandMovie.when(
        data: (movies) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: movies.Movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final treandmovie = movies.Movies[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                      '/detailspage/${Uri.encodeComponent(treandmovie.posterPath)}/${Uri.encodeComponent(treandmovie.title)}/${Uri.encodeComponent(treandmovie.overview)}/${Uri.encodeComponent(treandmovie.id)}',
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      treandmovie.posterPath,
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
