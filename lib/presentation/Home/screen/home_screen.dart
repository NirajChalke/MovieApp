import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/services/ApiService.dart';  

import 'package:movie_app/presentation/Home/widgets/section_widget.dart';
import 'package:movie_app/presentation/Home/widgets/top_banner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late  Future<List<MovieModel>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = ApiService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<MovieModel>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());  

          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Movies Available'));
          } else {
            final movies = snapshot.data!;
            return ListView(
              children: [
                TopBannerWidget(movies: movies),
                SectionWidget(
                  title: "Continue Watching",
                  movies: movies,
                  backgroundColor: Colors.black,
                ),
                SectionWidget(
                  title: "Popular on Netflix",
                  movies: movies,
                  backgroundColor:  Colors.black,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}