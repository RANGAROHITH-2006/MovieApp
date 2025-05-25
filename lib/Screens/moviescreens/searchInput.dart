import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/moviescreens/movies_screen.dart';
import 'package:movieapp/Screens/moviescreens/search_movie.dart';
import 'package:movieapp/Screens/moviescreens/social_media.dart';
import 'package:movieapp/providers/apiprovider/search_provider.dart';

class SearchInput extends ConsumerStatefulWidget {
  SearchInput({super.key});
  @override
  ConsumerState<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  final TextEditingController _movieController = TextEditingController();
  bool _showDropdown = false;
  bool _noMovieFound = false;

  final List<String> _search = ['Trending Movies', 'Movies', 'Popular'];

  void _handleSearch(String query) {
    final notifier = ref.read(searchMovieProvider.notifier);
    notifier.fetchSearchMovies(query);
    final movie = query.trim().toLowerCase();
    final found = _search.any((m) => m.toLowerCase() == movie);

    setState(() {
      _noMovieFound = !found;
      _showDropdown = false;
    });

    if (movie == 'trending movies') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MovieScreen()));
    } else if (movie == 'movies' || movie == 'popular') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SearchMovie()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Text(
                        'Movies',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              final query = _movieController.text.trim();
                              _handleSearch(query);
                              setState(() => _showDropdown = false);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
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
                    ],
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: _movieController,
                    onChanged: (value) {
                      setState(() {
                        _showDropdown = value.isNotEmpty;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  if (_showDropdown)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _search.length,
                        itemBuilder: (context, index) {
                          final suggestion = _search[index];
                          return ListTile(
                            title: Text(
                              suggestion,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              _movieController.text = suggestion;
                              _handleSearch(suggestion);
                              setState(() => _showDropdown = false);
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Center(
                child:
                    _noMovieFound
                        ? Text(
                          'No movie found',
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        )
                        : Text(
                          'Movie list here...',
                          style: TextStyle(color: Colors.white),
                        ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SocialMedia(),
    );
  }
}
