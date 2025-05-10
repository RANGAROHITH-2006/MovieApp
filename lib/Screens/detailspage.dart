import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/movies_screen.dart';
import 'package:movieapp/Screens/searchInput.dart';

class Detailspage extends StatefulWidget {
  final String image;
  final String title;
  final String overview;
  Detailspage(this.image, this.title, this.overview, {super.key});

  @override
  State<Detailspage> createState() => _Detailspage();
}

class _Detailspage extends State<Detailspage> {
  final List<String> trendingImages = [
    'assets/images/trending/O5.png',
    'assets/images/trending/O3.png',
    'assets/images/trending/T1.png',
    'assets/images/trending/T4.png',
    'assets/images/trending/T5.png',
  ];

  final List<String> originalImages = [
    'assets/images/trending/T6.png',
    'assets/images/trending/T4.png',
    'assets/images/trending/O3.png',
    'assets/images/trending/T5.png',
    'assets/images/trending/O5.png',
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
                            color: Colors.blueGrey[200],
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
                            color: Colors.blueGrey[200],
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
                            color: Colors.blueGrey[200],
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

  Widget imageList(List<String> trendingImages) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trendingImages.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                trendingImages[index],
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
