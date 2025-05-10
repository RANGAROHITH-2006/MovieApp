import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/original_api_service.dart';


import 'package:movieapp/models/original_search_model.dart';


final apiProvider = Provider<ApiServiceO>((ref){
   return ApiServiceO();
});

final originalmovieProvider = FutureProvider<OriginalMovie>((ref) async {
  return ApiServiceO().fetchMovies();
});




