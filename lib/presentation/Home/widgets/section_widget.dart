import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart' as movie_model;
import 'package:movie_app/presentation/Detail/screen/movie_detail.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<movie_model.MovieModel> movies;
  final Color backgroundColor;

  const SectionWidget({
    Key? key,
    required this.title,
    required this.movies,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          height: 150,
          color: backgroundColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index].show;
              final movie_to_navigate = movies[index];
              return GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(movie: movie_to_navigate),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      movie.image != null
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Set the desired corner radius
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10), // Match the clip to the decoration
                                child: Image.network(
                                  movie.image!.medium!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 170,
                                ),
                              ),
                            )
                          : Container(
                              height: 100,
                              width: 170,
                              color: Colors.black,
                              child: Center(child: Text('No Image')),
                            ),
                      SizedBox(height: 4),
                      Text(
                        movie.name,
                        style: TextStyle(fontSize: 14,color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}