import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailspage.dart';
import 'package:movieapp/Screens/movies_screen.dart';

import 'package:movieapp/Screens/search_movie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final overview =
      "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";
  final List<String> trendingImages = [
    "https://lumiere-a.akamaihd.net/v1/images/p_studio_elio_payoff_poster_v1_b71992a8.jpeg",
    "https://www.cinejosh.com/newsimg/newsmainimg/hit-2-movie-review-and-rating_b_0212220244.jpg",
    "https://images.hindustantimes.com/img/2024/08/17/1600x900/Kalki_2898_AD_OTT_release_1723868283514_1723868283753.jpg",
    "https://i.ytimg.com/vi/36W_9rsUH7E/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAF1gtaLX01Q65NXUJnpM7mEGM4Ew",
    "https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/medium/bhairavam-et00418461-1730806159.jpg",
  ];

  final List<String> originalImages = [
    "https://img.youtube.com/vi/8ZscPPpEWPo/maxresdefault.jpg",
    "https://i.ytimg.com/vi/roX7EqczsUs/maxresdefault.jpg",
    "https://i.ytimg.com/vi/DMgh2alw4u8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBYHXmg5AKLxFaYkArRg54smx5Omg",
    "https://thetelugufilmnagar.com/storage/2024/02/AMAran-Featured.webp",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBnyg8e6YWWCyTwrJmUSNLRqUg_IuJRq-Wg&s",
    "https://images.filmibeat.com/img/2025/04/newproject-2025-04-12t093816-894-1744431922.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/superman.png',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      'MOVIES',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.push('/searchInput');
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
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
                  ),
                  Positioned(
                    bottom: 140,
                    left: 20,
                    child: Text(
                      'Super Man',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Superman is a fictional superhero who first appeared\n in American comic books published by DC Comics.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: Text('Play'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heading('Trending Now', MovieScreen()),
              imageList(trendingImages),
              heading('Originals', SearchMovie()),
              imageList(originalImages),
              Container(
                child: BottomAppBar(
                  height: 100,
                  color: Colors.black,
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heading(String title, screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget imageList(List<String> trendingImages) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingImages.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          Detailspage(trendingImages[index], "", overview),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: Image.network(
                  trendingImages[index],
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
