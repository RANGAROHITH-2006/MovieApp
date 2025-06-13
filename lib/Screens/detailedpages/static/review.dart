import 'package:flutter/material.dart';

class MovieReviewBar extends StatelessWidget {
  final VoidCallback onLikePressed;
  final bool isLiked;

  const MovieReviewBar({
    super.key,
    required this.onLikePressed,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
              Text('Action', style: _textStyle),
              Text('Super Hero', style: _textStyle),
              Text('Fantasy', style: _textStyle),
              Text('Adventure', style: _textStyle),
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
              Text('Telugu', style: _textStyle),
              Text('English', style: _textStyle),
              Text('Hindi', style: _textStyle),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating Count',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const Text('60,020', style: _textStyle),
              const Text('Rating Average', style: _textStyle),
              const Text('4.8', style: _textStyle),
              Row(
                children: [
                  const Text('Like', style: TextStyle(color: Colors.white)),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: onLikePressed,
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const TextStyle _textStyle = TextStyle(
  color: Colors.white,
  fontSize: 13,
);
