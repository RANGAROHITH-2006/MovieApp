import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/original_search_model.dart';

class ApiServiceO {

  Future<OriginalMovie> fetchMovies() async {
    String url = 'https://apis.ccbp.in/movies-app/originals'; 
    
 try {
  final response = await http.get(
    Uri.parse(url),

    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhaHVsIiwicm9sZSI6IlBSSU1FX1VTRVIiLCJpYXQiOjE2MjMwNjU1MzJ9.D13s5wN3Oh59aa_qtXMo3Ec4wojOx0EZh8Xr5C5sRkU',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return OriginalMovie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies. Status: ${response.statusCode}');
  }
} catch (e) {
  throw Exception('Error: $e');
}
  }}