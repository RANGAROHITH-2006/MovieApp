import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MovieTopBanner extends StatelessWidget {
  final String image;
  final String title;
  final String video;
  final String overview;
  final VoidCallback onPlayPressed;

  const MovieTopBanner({
    super.key,
    required this.image,
    required this.title,
    required this.video,
    required this.overview,
    required this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          left: 0,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 25,
          child: TextButton(
          onPressed: () {
            context.push('/home_Screen');
          },
          child: const Text(
          'Movies',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
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
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              IconButton(
                icon: const FaIcon(
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
            title,
            style: const TextStyle(
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
                overview,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onPlayPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Play'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
