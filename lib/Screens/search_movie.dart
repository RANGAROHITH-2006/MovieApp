import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/detailspage.dart';
import 'package:movieapp/Screens/social_media.dart';
// import 'package:movieapp/models/original_search_model.dart';
import 'package:movieapp/providers/original_provider.dart';

class SearchMovie extends ConsumerWidget {
  const SearchMovie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalMovie = ref.watch(originalmovieProvider);
    //   List<String>  Movies =[
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUvw_eAfmPc1_Rt0sp4001xJn6MGfx1DrwK7cnO5q72QBnmCWe34D33zbWaIVtySjADoU&usqp=CAU",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7kpYmCNQ_YNsms4z-uwfw9JOOR5lCpBDQgrUSLX24RfjMAGJfpNLe-fOolXX1zzO5_8A&usqp=CAU",
    //   "https://images.hindustantimes.com/img/2024/08/17/1600x900/Kalki_2898_AD_OTT_release_1723868283514_1723868283753.jpg",
    //   "https://i.ytimg.com/vi/36W_9rsUH7E/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLAF1gtaLX01Q65NXUJnpM7mEGM4Ew",
    //   "https://assets-in.bmscdn.com/iedb/movies/images/mobile/listing/medium/bhairavam-et00418461-1730806159.jpg",
    //   "https://img.youtube.com/vi/8ZscPPpEWPo/maxresdefault.jpg",
    //   "https://i.ytimg.com/vi/roX7EqczsUs/maxresdefault.jpg",
    //   "https://i.ytimg.com/vi/DMgh2alw4u8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBYHXmg5AKLxFaYkArRg54smx5Omg",
    //   "https://thetelugufilmnagar.com/storage/2024/02/AMAran-Featured.webp",
    //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlBnyg8e6YWWCyTwrJmUSNLRqUg_IuJRq-Wg&s",
    //   "https://images.filmibeat.com/img/2025/04/newproject-2025-04-12t093816-894-1744431922.jpg",
    //   "https://i.ytimg.com/vi/WcIZblqc2e8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBjrfwImOHXfIhrbplrQ9OyzwA61Q",
    //   "https://static.toiimg.com/photo/msid-99039077/99039077.jpg?23844",
    //   "https://i.ytimg.com/vi/gOTJcmz5PJo/sddefault.jpg",
    //   "https://www.deccanchronicle.com/h-upload/2025/02/15/1890734-untitleddesign2.webp"

    // ];
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
        actions: [
          Row(
            children: [
              SizedBox(
                width: 160,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white70),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter Movie";
                    }
                    return null;
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.white, size: 40),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.userCircle, color: Colors.white),
                onPressed: () {
                  context.push('/accounts_screen');
                },
              ),
            ],
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: originalMovie.when(
        data: (orginals) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: orginals.results.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final OriginalMovie = orginals.results[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Detailspage(
                              OriginalMovie.posterPath,
                              OriginalMovie.title,
                              OriginalMovie.overview,
                            ),
                      ),
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      OriginalMovie.posterPath,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),

      bottomNavigationBar: SocialMedia(),
    );
  }
}
