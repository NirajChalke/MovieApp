import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart'; // Ensure this path is correct
import 'package:movie_app/domain/services/ApiService.dart';
import 'package:movie_app/presentation/Search/widgets/genere_section.dart';
import 'package:movie_app/presentation/Search/widgets/movie_section.dart'; // Ensure this path is correct
// Import your details page

class SearchMoviePage extends StatefulWidget {
  @override
  _SearchMoviePageState createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieModel> _searchResults = [];
  bool _isLoading = false;
  String _searchQuery = '';

  // Example genres list (You can replace this with your own)
  final List<String> genres = ["Action", "Drama", "Comedy", "Thriller", "Horror"];

  void _searchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _searchQuery = query;
    });

    try {
      // Call your API service to fetch movies based on the query
      List<MovieModel> results = await ApiService().searchMovies(query);
      setState(() {
        _searchResults = results;
      });
    } catch (error) {
      // Handle error appropriately (e.g., show a snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching movies: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Search Movies', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => _searchMovies(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty && _searchQuery.isEmpty
                      ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2/3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: genres.length,
                          itemBuilder: (context, index) {
                            return GenreContainer(genre: genres[index]);
                          },
                        )
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2/3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: _searchResults.length,
                          itemBuilder: (context, index) {
                            final movie = _searchResults[index];
                            return MovieContainer(movie: movie);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
