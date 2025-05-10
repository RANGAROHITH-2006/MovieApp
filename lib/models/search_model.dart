import 'dart:convert';

class SearchMovie {
  final List<Result> search;
  final int total;

  SearchMovie({
    required this.search,
    required this.total,
  });

  factory SearchMovie.fromRawJson(String str) => SearchMovie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchMovie.fromJson(Map<String, dynamic> json) => SearchMovie(
        search: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(search.map((x) => x.toJson())),
        "total": total,
      };
}

class Result {
  final String id;
  final String title;
  final String posterPath;
  final String backdropPath;

  Result({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}
