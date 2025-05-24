import 'dart:convert';

class Movies {
  final int id;
  final String title;
  final String overview;
  final String image;
  final String video;
  final String gener;

  Movies({
    required this.id,
    required this.title,
    required this.overview,
    required this.image,
    required this.video,
    required this.gener,
  });

  Movies copyWith({
    int? id,
    String? title,
    String? overview,
    String? image,
    String? video,
    String? gener,
  }) =>
      Movies(
        id: id ?? this.id,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        image: image ?? this.image,
        video: video ?? this.video,
        gener: gener ?? this.gener,
      );

  factory Movies.fromRawJson(String str) =>
      Movies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        id: json["id"] ?? 0,
        title: json["title"] ?? "No Title",
        overview: json["overview"] ?? "No Overview",
        image: json["image"] ?? "",
        video: json["video"] ?? "",
        gener: json["gener"] ?? "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "image": image,
        "video": video,
        "gener": gener,
      };
}
