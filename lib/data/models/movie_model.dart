import 'dart:convert';

class MovieModel {
  final double score;
  final Show show;

  MovieModel({
    required this.score,
    required this.show,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      score: json['score']?.toDouble() ?? 0.0,
      show: Show.fromJson(json['show']),
    );
  }

  static List<MovieModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieModel.fromJson(json)).toList();
  }
}class Show {
  final int id;
  final String name;
  final String? language;
  final String? status;
  final String? summary;
  final double? rating;
  final Image? image;
  final List<String>? genres;

  Show({
    required this.id,
    required this.name,
    this.language,
    this.status,
    this.summary,
    this.rating,
    this.image,
    this.genres,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    double? rating;
    if (json['rating'] != null) {
      final ratingMap = json['rating'] as Map<String, dynamic>;
      rating = ratingMap['average'] != null ? double.parse(ratingMap['average'].toString()) : null;
    }

    return Show(
      id: json['id'],
      name: json['name'] ?? '',
      language: json['language'],
      status: json['status'],
      summary: json['summary'],
      rating: rating,
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
      genres: json['genres'] != null ? List<String>.from(json['genres']) : null,
    );
  }
}
class Image {
  final String? medium;
  final String? original;

  Image({this.medium, this.original});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'],
      original: json['original'],
    );
  }
}
