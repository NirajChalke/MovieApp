import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart' as movie_model;

class MovieDetailsPage extends StatelessWidget {
  final movie_model.MovieModel movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  // Function to remove HTML tags from a string
  String removeHtmlTags(String? htmlString) {
    if (htmlString == null) return 'No summary available';
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.network(
              movie.show.image!.original ?? '',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.show.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'IMDb ',
                                  style:
                                      TextStyle(fontSize: 16, fontWeight:FontWeight.bold,color: Colors.black),
                                ),
                                Text(
                                  movie.show.rating?.toString() ?? 'N/A',
                                  style:
                                      TextStyle(fontSize: 16,fontWeight:FontWeight.bold, color: Colors.black),
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        Text(
                                 "4.5",
                                  style:
                                      TextStyle(fontSize: 16,fontWeight:FontWeight.bold, color: Colors.white),
                                ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Genres: ${movie.show.genres?.join(', ') ?? 'N/A'}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      removeHtmlTags(movie.show.summary),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
