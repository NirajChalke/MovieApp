import 'package:flutter/material.dart';
import 'package:movie_app/presentation/Home/screen/home_screen.dart';
import 'package:movie_app/presentation/Search/screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchMoviePage(), // Ensure you create a SearchScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Adjust the size of the image as needed
            Image.asset(
              'assets/images/movies-app.png', // Replace with your image path
              height: 30, // Height of the icon
              width: 30, // Width of the icon
            ),
            SizedBox(width: 8), // Spacing between the icon and the title
            Text(
              'Movie App',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
