import 'package:flixxiewatch/gridviews/allmoviesgridview.dart';
import 'package:flixxiewatch/gridviews/favoritegridview.dart';
import 'package:flixxiewatch/gridviews/mostwatchedgridview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*  int _currentIndex = 0;*/
  PopupMenuItem _buildPopupMenuItem({
    required String text,
    required VoidCallback onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: ListTile(title: Text(text), dense: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.01,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      backgroundColor: Colors.black,
      /*  bottomNavigationBar: MyBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),*/
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.02,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/logo.png",
                    height: height * 0.07,
                    width: width * 0.3,
                  ),
                ),
                PopupMenuTheme(
                  data: PopupMenuThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 15,
                  ),
                  child: PopupMenuButton(
                    tooltip: "More Options",
                    itemBuilder: (context) => [
                      _buildPopupMenuItem(text: 'Iron Man', onTap: () {}),
                      _buildPopupMenuItem(
                        text: 'The Incredible Hulk',
                        onTap: () {},
                      ),
                      _buildPopupMenuItem(text: 'Thor', onTap: () {}),
                      _buildPopupMenuItem(
                        text: 'Captain America',
                        onTap: () {},
                      ),
                      _buildPopupMenuItem(text: 'The Avengers', onTap: () {}),
                      _buildPopupMenuItem(
                        text: 'Guardians of the Galaxy',
                        onTap: () {},
                      ),
                      _buildPopupMenuItem(text: 'Ant-Man', onTap: () {}),
                      _buildPopupMenuItem(text: 'Doctor-Strange', onTap: () {}),
                      _buildPopupMenuItem(text: 'Spider-Man', onTap: () {}),
                      _buildPopupMenuItem(text: 'Black Panther', onTap: () {}),
                      _buildPopupMenuItem(text: 'Captain Marvel', onTap: () {}),
                    ],
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/marvel-intro.gif",
              height: height * 0.2,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: height * 0.04),
            Text(
              "Marvel Movies Timeline",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.04),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: height * 0.5),
              child: AllMoviesGrid(),
            ),
            SizedBox(height: height * 0.04),
            Text(
              "Marvel's Most Watched",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.04),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: height * 0.5),
              child: MostWatchGrid(),
            ),
            SizedBox(height: height * 0.04),
            Text(
              "Marvel's Favourited Movies",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.04),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: height * 0.5),
              child: FavoritesGrid(),
            ),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
