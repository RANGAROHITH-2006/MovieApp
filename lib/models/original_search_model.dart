// import 'package:meta/meta.dart';
import 'dart:convert';

class OriginalMovie {
    final List<Result> results;
    final int total;

    OriginalMovie({
        required this.results,
        required this.total,
    });

    OriginalMovie copyWith({
        List<Result>? results,
        int? total,
    }) => 
        OriginalMovie(
            results: results ?? this.results,
            total: total ?? this.total,
        );

    factory OriginalMovie.fromRawJson(String str) => OriginalMovie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OriginalMovie.fromJson(Map<String, dynamic> json) => OriginalMovie(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total": total,
    };
}

class Result {
    final String id;
    final String title;
    final String posterPath;
    final String backdropPath;
    final String overview;

    Result({
        required this.id,
        required this.title,
        required this.posterPath,
        required this.backdropPath,
        required this.overview,
    });

    Result copyWith({
        String? id,
        String? title,
        String? posterPath,
        String? backdropPath,
        String? overview,
    }) => 
        Result(
            id: id ?? this.id,
            title: title ?? this.title,
            posterPath: posterPath ?? this.posterPath,
            backdropPath: backdropPath ?? this.backdropPath,
            overview: overview ?? this.overview,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "overview": overview,
    };
}
