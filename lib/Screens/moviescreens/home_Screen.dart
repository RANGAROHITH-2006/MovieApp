import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage.dart';
import 'package:movieapp/Screens/moviescreens/movies_screen.dart';

import 'package:movieapp/Screens/moviescreens/search_movie.dart';
import 'package:movieapp/supabaseScreens/telugu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final overview =
      "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";
  final List<Map<String, String>> trendingMovies = [
    {
      "title": "Elio",
      "image":
          "https://lumiere-a.akamaihd.net/v1/images/p_studio_elio_payoff_poster_v1_b71992a8.jpeg",
      "video": "https://youtu.be/ETVi5_cnnaE?si=xN_3vsq2ePhIa4DR",
    },
    {
      "title": "Single",
      "image": "https://static.digit.in/product/single-1-b804537713.jpeg",
      "video": "https://youtu.be/q2KdzXF_svA?si=nqdDVB47_-MhErCx",
    },
    {
      "title": "Hit 2",
      "image":
          "https://www.cinejosh.com/newsimg/newsmainimg/hit-2-movie-review-and-rating_b_0212220244.jpg",
      "video": "https://youtu.be/DOMqmBrqVR4?si=wxIcgL9EGhvktjhd",
    },
    {
      "title": "Kalki 2898 AD",
      "image":
          "https://images.hindustantimes.com/img/2024/08/17/1600x900/Kalki_2898_AD_OTT_release_1723868283514_1723868283753.jpg",
      "video": "https://youtu.be/y1-w1kUGuz8?si=iNQsJJZW23wHgR0T",
    },
    {
      "title": "Devara",
      "image":
          "https://m.media-amazon.com/images/M/MV5BZmJmNzg0NjYtM2VhZi00MjlhLWExMzUtOWMwNjQ4MmQ5N2UyXkEyXkFqcGc@._V1_.jpg",
      "video": "https://youtu.be/mmKIkTLRZao?si=TDoIoMaBbo6bPHgl",
    },
    {
      "title": "BhairavaM",
      "image":
          "https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/medium/bhairavam-et00418461-1730806159.jpg",
      "video": "https://youtu.be/3qiqCTvhpOg?si=zRhaGAMVrqi_cwTs",
    },
  ];

  final List<Map<String, String>> originalMovies = [
    {
      "title": "Shaakuntalam",
      "image": "https://img.youtube.com/vi/8ZscPPpEWPo/maxresdefault.jpg",
      "video": "https://youtu.be/66Kv0TdXYyk?si=AIZhDcZz0QolXogy",
    },
    {
      "title": "Tillu 2",
      "image": "https://i.ytimg.com/vi/roX7EqczsUs/maxresdefault.jpg",
      "video": "https://youtu.be/roX7EqczsUs?si=e5ThlxeVVeee4vmj",
    },
    {
      "title": "Thala",
      "image":
          "https://i.ytimg.com/vi/DMgh2alw4u8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBYHXmg5AKLxFaYkArRg54smx5Omg",
      "video": "https://youtu.be/WmDHwALR3R8?si=RYPDW0xzQxIajxmi",
    },
    {
      "title": "Amaran",
      "image":
          "https://thetelugufilmnagar.com/storage/2024/02/AMAran-Featured.webp",
      "video": "https://youtu.be/U3aPapvUihg?si=syA2o3jiJd8_aa_4",
    },
    {
      "title": "Daaku Maharaaj",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBnyg8e6YWWCyTwrJmUSNLRqUg_IuJRq-Wg&s",
      "video": "https://youtu.be/jSvmAwDFm10?si=d4jM5M3qixcQwnwx",
    },
    {
      "title": "MAD-2",
      "image":
          "https://images.filmibeat.com/img/2025/04/newproject-2025-04-12t093816-894-1744431922.jpg",
      "video": "https://youtu.be/1Sw7modBwsM?si=qEbLviY1B5xh5RsF",
    },
  ];

  final List<Map<String, String>> popularMovies = [
    {
      "title": "HIT-3",
      "image":
          "https://m.media-amazon.com/images/M/MV5BOGFmOGRkMTQtZDhjNC00MmJlLThmZmEtZWJmMmVmOGIxYmFiXkEyXkFqcGc@._V1_.jpg",
      "video": "https://youtu.be/kAtfaaUgDRU?si=u5oxQ5NzNTrElVB-",
    },
    {
      "title": "Game Changer",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6a/Game_Changer_Telugu.jpg",
      "video": "https://youtu.be/zHiKFSBO_JE?si=au3sSEY6o7oOyHq8",
    },
    {
      "title": "Pushpa-2",
      "image":
          "https://m.media-amazon.com/images/M/MV5BZjllNTdiM2QtYjQ0Ni00ZGM1LWFlYmUtNWY0YjMzYWIxOTYxXkEyXkFqcGc@._V1_.jpg",
      "video": "https://youtu.be/g3JUbgOHgdw?si=UyRMkSMpvXQdZbc6",
    },
    {
      "title": "Swag",
      "image":
          "https://images.filmibeat.com/img/220x275/popcorn/movie_posters/swag-20240229154012-22661.jpg",
      "video": "https://youtu.be/QOhbHFpbseI?si=YBAVOoAZtuTxYNY6",
    },
    {
      "title": "Lucky Baskhar",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6c/Lucky_Baskhar_film_poster.jpg",
      "video": "https://youtu.be/FonKx5wvuHI?si=FMs6eyoXytYNKzrW",
    },
    {
      "title": "Mathu Vadalara 2",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/19/Mathu_Vadalara_2.jpg",
      "video": "https://youtu.be/ahZX-ewuZP8?si=0fm8phDCRWCTpyvD",
    },
  ];

  @override
  Widget build(BuildContext context) {
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

              heading('Trending Now', MovieScreen()),
              imageList(trendingMovies),
              heading('Original', SearchMovie()),
              imageList(originalMovies),
              heading('Popular', TeluguMovieScreen()),
              imageList(popularMovies),
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

  Widget imageList(List<Map<String, String>> trendingMovies) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingMovies.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final movie = trendingMovies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Detailspage(
                        movie['image'] ?? '',
                        movie['title'] ?? '',
                        overview,
                        movie['video'] ?? '',
                      ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie['image'] ?? '',
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
