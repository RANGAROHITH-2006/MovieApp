import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';


final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider = FutureProvider((ref) async {
  final query = ref.watch(searchQueryProvider);
  final api = MovieServices();

  return api.searchMovies(query);
});