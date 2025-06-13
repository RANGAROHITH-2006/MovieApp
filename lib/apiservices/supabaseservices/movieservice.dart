import 'package:movieapp/models/supabasemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MovieServices{
   static Future getTeluguMovies() async{
      try{
        var response = await Supabase.instance.client.from('Telugu').select().withConverter((data) => data);;
        print(response);
      }catch (e){
        print(e.toString());
      }
    }

    static Future getHindiMovies() async{
      try{
        var response = await Supabase.instance.client.from('Hindi').select().withConverter((data) => data);;
        print(response);
      }catch (e){
        print(e.toString());
      }
    }


    static Future getEnglishMovies() async{
      try{
        var response = await Supabase.instance.client.from('English').select().withConverter((data) => data);;
        print(response);
      }catch (e){
        print(e.toString());
      }
    }


     Future<List<Movies>> getFavoriteMovies() async{
      try{
        var response = await Supabase.instance.client.from('Favorite').select().order('added_time',  ascending: false);
         final data = response as List;
         print(data);
      return data.map((e) => Movies.fromJson(e)).toList();
      
    } catch (e) {
      print(e.toString());
      return [];
      }
    }


    static Future getMyMovies() async{
      try{
        var response = await Supabase.instance.client.from('MyMovies').select().order('added_time', ascending: false).withConverter((data) => data);
        print(response);
      }catch (e){
        print(e.toString());
      }
    }


  static Future<String> addMovie(Map<String, dynamic> movie) async {
        final title = movie['title'];

        final existing = await Supabase.instance.client
            .from('Favorite')
            .select()
            .eq('title', title)
            .maybeSingle();

      if (existing != null) {
        return 'Movie already exists';
      }
      await Supabase.instance.client.from('Favorite').insert(movie);
      return 'Movie added to Favorites';
    }



static Future<String> removeMovie(Map<String, dynamic> movie) async {
  final title = movie['title'];

  final existing = await Supabase.instance.client
      .from('Favorite')
      .select()
      .eq('title', title)
      .maybeSingle();

  if (existing != null) {
    await Supabase.instance.client.from('Favorite').delete().eq('title', title);
    return 'Movie removed from Favorites';
  }

  return 'Movie not in Favorites';
}


static Future<String> addMyMovie(Map<String, dynamic> movie) async {
        final title = movie['title'];

        final existing = await Supabase.instance.client
            .from('MyMovies')
            .select()
            .eq('title', title)
            .maybeSingle();

      if (existing != null) {
        return 'Movie already exists';
      }
      await Supabase.instance.client.from('MyMovies').insert(movie);
      return 'Movie added to Favorites';
    }



    Future<List<Map<String, dynamic>>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await Supabase.instance.client
        .from('all_movies')
        .select()
        .ilike('title', '%$query%');

    return List<Map<String, dynamic>>.from(response);
  }
}