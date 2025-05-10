import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/search_model.dart';
import 'package:movieapp/models/trending_model.dart';

class ApiService {
  static const String _authToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhaHVsIiwicm9sZSI6IlBSSU1FX1VTRVIiLCJpYXQiOjE2MjMwNjU1MzJ9.D13s5wN3Oh59aa_qtXMo3Ec4wojOx0EZh8Xr5C5sRkU';

  final Map<String, String> headers = {
    'Authorization': _authToken,
    'Content-Type': 'application/json',
  };

  Future<Treand> fetchTrendingMovies() async {
    const url = 'https://apis.ccbp.in/movies-app/trending-movies';

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return Treand.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load trending movies. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching trending movies: $e');
    }
  }

 
  Future<SearchMovie> fetchSearchedMovies(String query) async {
    final url =
        'https://apis.ccbp.in/movies-app/movies-search?search=$query';

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
        
      if (response.statusCode == 200) {
        return SearchMovie.fromRawJson(response.body);
      } else {
        throw Exception(
            'Failed to load search results. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching search movies: $e');
    }
  }
}
