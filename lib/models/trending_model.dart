// import 'package:meta/meta.dart';
import 'dart:convert';

class Treand {
    final List<TMovie> Movies;
    final int total;

    Treand({
        required this.Movies,
        required this.total,
    });

    Treand copyWith({
        List<TMovie>? results,
        int? total,
    }) => 
        Treand(
            Movies: results ?? this.Movies,
            total: total ?? this.total,
        );

    factory Treand.fromRawJson(String str) => Treand.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Treand.fromJson(Map<String, dynamic> json) => Treand(
        Movies: List<TMovie>.from(json["results"].map((x) => TMovie.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(Movies.map((x) => x.toJson())),
        "total": total,
    };
}

class TMovie {
    final String id;
    final String title;
    final String posterPath;
    final String backdropPath;
    final String overview;

    TMovie({
        required this.id,
        required this.title,
        required this.posterPath,
        required this.backdropPath,
        required this.overview,
    });

    TMovie copyWith({
        String? id,
        String? title,
        String? posterPath,
        String? backdropPath,
        String? overview,
    }) => 
        TMovie(
            id: id ?? this.id,
            title: title ?? this.title,
            posterPath: posterPath ?? this.posterPath,
            backdropPath: backdropPath ?? this.backdropPath,
            overview: overview ?? this.overview,
        );

    factory TMovie.fromRawJson(String str) => TMovie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TMovie.fromJson(Map<String, dynamic> json) => TMovie(
  id: json["id"]?.toString() ?? "",
  title: json["title"] ?? "",
  posterPath: json["poster_path"] ?? "",
  backdropPath: json["backdrop_path"] ?? "",
  overview: json["overview"] ?? "",
);


    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "overview": overview,
    };
}
