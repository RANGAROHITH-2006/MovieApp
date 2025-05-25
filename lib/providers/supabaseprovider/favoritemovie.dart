import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/supabaseservices/movieservice.dart';
import 'package:movieapp/models/supabasemodel.dart';


final movieAddProvider = Provider((ref) {
  return MovieServices();
});

final favoritemoviesProvider = FutureProvider<List<Movies>>((ref) async {
  
 final service = ref.read(movieAddProvider);
  return await service.getFavoriteMovies();
  
});

