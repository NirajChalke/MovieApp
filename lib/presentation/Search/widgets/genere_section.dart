import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {
  final String genre;

   GenreContainer({Key? key, required this.genre}) : super(key: key);

  // Define a mapping of genres to gradients
  final Map<String, List<Color>> genreGradients = {
    'Action': [Colors.redAccent, Colors.orangeAccent],
    'Drama': [Colors.blue, Colors.lightBlueAccent],
    'Comedy': [Colors.yellowAccent, Colors.amber],
    'Horror': [Colors.black, Colors.red],
    'Thriller': [Colors.purple, Colors.indigo],
    'Romance': [Colors.pink, Colors.pinkAccent],
    'Documentary': [Colors.green, Colors.teal],
    'Fantasy': [Colors.deepPurple, Colors.purpleAccent],
    // Add more genres and their gradients as needed
  };

  @override
  Widget build(BuildContext context) {
    // Get the gradient for the given genre or default to a single color
    List<Color> gradientColors = genreGradients[genre] ?? [Colors.grey[850]!];

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          genre,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
