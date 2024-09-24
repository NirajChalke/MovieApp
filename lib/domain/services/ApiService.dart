import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/movie_model.dart';// Import the model

class ApiService {
  final String apiUrl = 'https://api.tvmaze.com/search/shows?q=all';  // Example API endpoint

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return MovieModel.fromJsonList(jsonList);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
  final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return MovieModel.fromJsonList(jsonList);
  } else {
    throw Exception('Failed to load movies');
  }
}

}
