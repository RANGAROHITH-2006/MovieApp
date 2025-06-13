import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Screens/detailedpages/detailspage2.dart';

import 'package:movieapp/Screens/detailedpages/static/movies_list.dart';
import 'package:movieapp/Screens/detailedpages/static/movies_section.dart';
import 'package:movieapp/Screens/detailedpages/static/review.dart';
import 'package:movieapp/Screens/detailedpages/static/top_banner.dart';
import 'package:movieapp/Screens/detailedpages/videoscreen.dart';
import 'package:movieapp/Screens/detailedpages/static/social_media.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';
import 'package:movieapp/providers/supabaseprovider/favoritemovie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Detailspage extends ConsumerStatefulWidget {
  final String image;
  final String title;
  final String overview;
  final String video;
  Detailspage(this.image, this.title, this.overview, this.video, {super.key});
  @override
  ConsumerState<Detailspage> createState() => _Detailspage();
}

class _Detailspage extends ConsumerState<Detailspage> {
  final overview =
      "Movies tell stories, explore human experiences, and offer entertainment through the medium of moving images";

  bool heart = false;
  @override
  void initState() {
    super.initState();
    checkInFavorite();
  }

  Future<void> checkInFavorite() async {
    final existing =
        await Supabase.instance.client
            .from('Favorite')
            .select()
            .eq('title', widget.title)
            .maybeSingle();

    setState(() {
      heart = existing != null;
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
              MovieTopBanner(
                image: widget.image,
                title: widget.title,
                overview: overview,
                video: widget.video,
                onPlayPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              YouTubeVideoScreen(videoUrl: widget.video),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              MovieReviewBar(
                isLiked: heart,
                onLikePressed: () async {
                  final movie = {
                    'title': widget.title,
                    'image': widget.image,
                    'video': widget.video,
                    'overview': widget.overview,
                  };
                  setState(() {
                    heart = !heart;
                  });

                  try {
                    final message =
                        heart
                            ? await MovieServices.addMovie(movie)
                            : await MovieServices.removeMovie(movie);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                    ref.invalidate(favoritemoviesProvider);
                  } catch (e) {
                    print('Favorite toggle failed: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Something went wrong')),
                    );
                  }
                },
              ),
              MoviesSection(
                title: 'More like this',
                movies: popularMovies,
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
               SocialMedia(),
            ],
          ),
        ),
      ),
      
    );
  }
}
