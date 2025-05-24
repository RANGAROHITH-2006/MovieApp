import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage.dart';
import 'package:movieapp/Screens/detailedpages/videoscreen.dart';
import 'package:movieapp/Screens/moviescreens/movies_screen.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';

class Detailspage2 extends StatefulWidget {
  final String image;
  final String title;
  final String overview;
   final String video;
  Detailspage2(this.image, this.title, this.overview,this.video, {super.key});

  @override
  State<Detailspage2> createState() => _Detailspage2();
}

class _Detailspage2 extends State<Detailspage2> {

final overview =
      "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";

   final List<Map<String, String>> trendingMovies = [
    {
      "title": "Elio",
      "image":
          "https://lumiere-a.akamaihd.net/v1/images/p_studio_elio_payoff_poster_v1_b71992a8.jpeg",
      "video": "https://example.com/videos/elio.mp4",
    },
    {
      "title": "Single",
      "image": "https://static.digit.in/product/single-1-b804537713.jpeg",
      "video": "https://youtu.be/q2KdzXF_svA?si=dyU5LdXqDY_Z1c4o",
    },
    {
      "title": "Hit 2",
      "image":
          "https://www.cinejosh.com/newsimg/newsmainimg/hit-2-movie-review-and-rating_b_0212220244.jpg",
      "video": "https://example.com/videos/hit2.mp4",
    },
    {
      "title": "Kalki 2898 AD",
      "image":
          "https://images.hindustantimes.com/img/2024/08/17/1600x900/Kalki_2898_AD_OTT_release_1723868283514_1723868283753.jpg",
      "video": "https://example.com/videos/kalki2898ad.mp4",
    },
    {
      "title": "Devara",
      "image":
          "https://m.media-amazon.com/images/M/MV5BZmJmNzg0NjYtM2VhZi00MjlhLWExMzUtOWMwNjQ4MmQ5N2UyXkEyXkFqcGc@._V1_.jpg",
      "video": "https://example.com/videos/unknown.mp4",
    },
    {
      "title": "BhairavaM",
      "image":
          "https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/medium/bhairavam-et00418461-1730806159.jpg",
      "video": "https://example.com/videos/bhairavam.mp4",
    },
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
                  Image.network(
                    widget.image,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 60,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchInput(),
                              ),
                            );
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
                    bottom: 180,
                    left: 20,
                    child: Text(
                      '${widget.title}',
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
                          '${widget.overview}',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(
                builder: (_) => YouTubeVideoScreen(
                  videoUrl: widget.video,  
                ),));

                          },
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Super Hero',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Fantasy',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Adventure',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'English',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Hindi',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          'Rating Average',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Text(
                          '4.8',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              heading('More like this'),
              imageList(trendingMovies),
            ],
          ),
        
        ),
      
      ),
    bottomNavigationBar: SocialMedia(),
    );
  }

  Widget heading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovieScreen()),
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
                builder: (context) => Detailspage(
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
                errorBuilder: (context, error, stackTrace) => Container(
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