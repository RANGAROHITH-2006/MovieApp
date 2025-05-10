import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/apiservices/treand_api_service.dart';
import 'package:movieapp/models/trending_model.dart';

final apiProvider = Provider<ApiService>((ref){
   return ApiService();
});

final movieProvider = FutureProvider<Treand>((ref) async {
  return ApiService().fetchTrendingMovies();
});




