import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailedpages/detailspage2.dart';
import 'package:movieapp/Screens/detailedpages/videoscreen.dart';
import 'package:movieapp/Screens/moviescreens/movies_screen.dart';
import 'package:movieapp/Screens/moviescreens/searchInput.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';
import 'package:movieapp/providers/supabaseprovider/favoritemovie.dart';

class Detailspage extends ConsumerStatefulWidget {
  final String image;
  final String title;
  final String overview;
   final String video;
  Detailspage(this.image, this.title, this.overview,this.video, {super.key});

  @override
  ConsumerState<Detailspage> createState() => _Detailspage();
}

class _Detailspage extends ConsumerState<Detailspage> {

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

  bool heart = false;

  void onclick(){
    setState(() {
      heart =!heart;
    });
  }

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
                builder: (contex) => YouTubeVideoScreen(
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
                        Row(
                          children: [
                              Text('Like',style: TextStyle(color: Colors.white,fontSize: 15),),
                              SizedBox(width: 15),
                              IconButton(
            onPressed: () async {
              
              final movie={
              'title': widget.title,
              'image':  widget.image,
              'video': widget.video, 
              'overview': widget.overview,
              };
              
              ref.invalidate(favoritemoviesProvider);
      if (heart){      
      try {
        final message = await MovieServices.addMovie(movie);
        ref.refresh(favoritemoviesProvider);
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(message)),
        );
        Navigator.pop(context);
      } catch (e) {
        print('Error adding movie: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error adding movie')),
        );
      }}else{
        try {
        final message = await MovieServices.removeMovie(movie);
        ref.refresh(favoritemoviesProvider);
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text(message)),
        );
        Navigator.pop(context);
      } catch (e) {
        print('Error adding movie: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error adding movie')),
        );}
      }
      
      onclick();
            },
            icon: Icon(heart ? Icons.favorite : Icons.favorite_border, color: Colors.white, size: 20),
          ),
                          ],
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              heading('More like this'),
              imageList(popularMovies),
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
                builder: (context) => Detailspage2(
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