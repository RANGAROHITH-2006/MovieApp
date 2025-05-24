import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/supabasemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final englishmoviesProvider = FutureProvider<List<Movies>>((ref) async {
  final response = await Supabase.instance.client
      .from('English')
      .select('id, title, overview, image, video , genre');

  final data = response as List;
  return data.map((e) => Movies.fromJson(e)).toList();
});