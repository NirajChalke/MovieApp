import 'package:flutter/material.dart';
import 'package:movie_app/presentation/Detail/screen/movie_detail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:movie_app/data/models/movie_model.dart' as movie_model;

class TopBannerWidget extends StatefulWidget {
  final List<movie_model.MovieModel> movies;

  const TopBannerWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  _TopBannerWidgetState createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          child: PageView.builder(
            itemCount: widget.movies.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              final movie = widget.movies[index];
              return GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(movie: movie),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: movie.show.image != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(movie.show.image!.original!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.tv,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Movie Not Found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
       SmoothPageIndicator(
          controller: _pageController,
          count: widget.movies.length,
          effect: WormEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 15,
            spacing: 4,
          ),
          onDotClicked: (index) => _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
      ],
    );
  }
}
