import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';
import 'package:movieapp/models/supabasemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final MymoviesProvider = FutureProvider<List<Movies>>((ref) async {
  final response = await Supabase.instance.client
      .from('MyMovies')
      .select('id, title, overview, image, video , genre').order('added_time',  ascending: false);

  final data = response as List;
  return data.map((e) => Movies.fromJson(e)).toList();
});

final movieAddProvider = Provider((ref) {
  return MovieServices();
});