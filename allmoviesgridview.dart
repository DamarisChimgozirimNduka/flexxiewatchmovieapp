import 'package:flixxiewatch/jsoncalling.dart';
import 'package:flixxiewatch/pages/databaseapi.dart';

import 'package:flixxiewatch/pages/moviesdetailpage.dart';
import 'package:flutter/material.dart';

class AllMoviesGrid extends StatelessWidget {
  const AllMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataBase>(
      future: fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48),
                const SizedBox(height: 16),
                Text('Error: ${snapshot.error}', textAlign: TextAlign.center),
              ],
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Center(child: Text('No movies found'));
        }

        final movies = snapshot.data!.allMovies;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.5,
          ),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index]; // i want to get the current movie

            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/${movie.image}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                        child: const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllMovieDetailsPage(movie: movie),
                      ),
                    );
                  },
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
