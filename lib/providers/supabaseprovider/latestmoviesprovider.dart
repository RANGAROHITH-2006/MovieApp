import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';

// Provider for latest 5 movies
final latestMoviesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  return await MovieServices.getLatestMovies();
});

// Provider for popular movies (next 5 movies)
final popularMoviesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  return await MovieServices.getPopularMovies();
});
