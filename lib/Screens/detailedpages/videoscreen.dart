import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage2.dart';
import 'package:movieapp/Screens/detailedpages/static/movies_list.dart';
import 'package:movieapp/Screens/detailedpages/static/movies_section.dart';
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
              context.push('/searchInput');
            },
            icon: Icon(Icons.search, color: Colors.white, size: 30),
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
                  PopupMenuItem(
                    onTap: () {
                      context.push('/myfavorite');
                    },
                    child: Text(
                      'Favorite',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                   PopupMenuItem(
                    onTap: () {
                      context.push('/accounts_screen');
                    },
                    child: Text('Profile', style: TextStyle(color: Colors.white)),
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
                     MoviesSection(
                title: 'Most Watched',
                movies: trendingMovies,
                onMovieTap: (movie) {
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
              ),
               MoviesSection(
                title: 'More like this',
                movies: originalMovies,
                onMovieTap: (movie) {
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
              ),
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
}
