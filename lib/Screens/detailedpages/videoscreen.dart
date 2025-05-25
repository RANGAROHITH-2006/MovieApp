import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage2.dart';
import 'package:movieapp/supabaseScreens/telugu.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  final String videoUrl;
  const YouTubeVideoScreen({super.key, required this.videoUrl});

  @override
  State<YouTubeVideoScreen> createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  final overview =
      "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";

  final List<Map<String, String>> popularMovies = [
    {
      "title": "Popular Movie 1",
      "image":
          "https://m.media-amazon.com/images/M/MV5BOGFmOGRkMTQtZDhjNC00MmJlLThmZmEtZWJmMmVmOGIxYmFiXkEyXkFqcGc@._V1_.jpg",
      "video": "https://example.com/videos/popular1.mp4",
    },
    {
      "title": "Game Changer",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6a/Game_Changer_Telugu.jpg",
      "video": "https://example.com/videos/gamechanger.mp4",
    },
    {
      "title": "Popular Movie 3",
      "image":
          "https://m.media-amazon.com/images/M/MV5BZjllNTdiM2QtYjQ0Ni00ZGM1LWFlYmUtNWY0YjMzYWIxOTYxXkEyXkFqcGc@._V1_.jpg",
      "video": "https://example.com/videos/popular3.mp4",
    },
    {
      "title": "Swag",
      "image":
          "https://images.filmibeat.com/img/220x275/popcorn/movie_posters/swag-20240229154012-22661.jpg",
      "video": "https://example.com/videos/swag.mp4",
    },
    {
      "title": "Lucky Baskhar",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/6c/Lucky_Baskhar_film_poster.jpg",
      "video": "https://example.com/videos/luckybaskhar.mp4",
    },
    {
      "title": "Mathu Vadalara 2",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/19/Mathu_Vadalara_2.jpg",
      "video": "https://example.com/videos/mathuvadalara2.mp4",
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

  late YoutubePlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    if (videoId == null) {
      _hasError = true;
      return;
    }

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      context.push('/telugu');
                    },

                    child: Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
          ),
        ],
      ),
      body:
          _hasError
              ? const Center(child: Text('Invalid YouTube URL'))
              : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                      builder: (context, player) => player,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Genres',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'Action',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Comedy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Fantasy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Adventure',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Audio Available',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'Telugu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Hindi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Rating Count',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '60,020',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Rating Average',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heading('More like this'),
                    imageList(popularMovies),
                    heading('Most Watched'),
                    imageList(originalMovies),
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
    );
  }

  Widget heading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeluguMovieScreen()),
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

  Widget imageList(List<Map<String, dynamic>> trendingImages) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingImages.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final movie = trendingImages[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Detailspage2(
                        movie['image'] ?? '',
                        movie['title'] ?? '',
                        movie['overview'] ?? '',
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
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 120,
                        color: Colors.grey,
                        child: Icon(Icons.broken_image),
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
