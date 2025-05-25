import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SearchMovieState {
  final bool isLoading;
  final List<dynamic> results;
  final String errorMessage;

  SearchMovieState({
    required this.isLoading,
    required this.results,
    required this.errorMessage,
  });

  factory SearchMovieState.initial() {
    return SearchMovieState(isLoading: false, results: [], errorMessage: '');
  }

  SearchMovieState copyWith({bool? isLoading, List<dynamic>? results, String? errorMessage}) {
    return SearchMovieState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SearchMovieNotifier extends StateNotifier<SearchMovieState> {
  SearchMovieNotifier() : super(SearchMovieState.initial());

  Future<void> fetchSearchMovies(String query) async {
    state = state.copyWith(isLoading: true, errorMessage: '', results: []);

    final url = 'https://apis.ccbp.in/movies-app/movies-search?search=$query'; 

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final results = decoded['results'];
        state = state.copyWith(isLoading: false, results: results);
      } else {
        state = state.copyWith(isLoading: false, errorMessage: 'Failed to load results');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}


final searchMovieProvider = StateNotifierProvider<SearchMovieNotifier, SearchMovieState>(
  (ref) => SearchMovieNotifier(),
);
