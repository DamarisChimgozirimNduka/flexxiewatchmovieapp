import 'package:flixxiewatch/jsoncalling.dart';
import 'package:flutter/material.dart';
import 'package:flixxiewatch/components/better.dart';
import 'package:url_launcher/url_launcher.dart';

class MostWatchedPage extends StatelessWidget {
  final MostWatched movie;
  void _directtoweb(BuildContext context) async {
    try {
      final url = Uri.parse(movie.movielink);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        // Dama the mode helps to tell the app to go to the web browser.
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open the link")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  const MostWatchedPage({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.005,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                height: height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(height * 0.010),
                    topRight: Radius.circular(height * 0.010),
                    bottomLeft: Radius.circular(height * 0.010),
                    bottomRight: Radius.circular(height * 0.010),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/${movie.image}"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _directtoweb(context),

              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.05,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "WATCH NOW",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            AssetVideoPlayer(assetPath: "assets/videos/${movie.video}"),
            SizedBox(height: height * 0.03),
            Text(
              movie.description,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
