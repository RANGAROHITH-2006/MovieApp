import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        height: 110,
        color: Colors.black,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _launchURL('https://www.google.com/');
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _launchURL('https://www.instagram.com/');
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _launchURL('https://twitter.com/');
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.youtube,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _launchURL('https://www.youtube.com/');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
