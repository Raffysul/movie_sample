import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'movie_provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<MovieProvider>(context, listen: false).getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.movie == null) {
            return const CircularProgressIndicator();
          }

          final Movie movie = movieProvider.movie!;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: Image.network(
                    movie.imageUrl,
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  movie.title,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rating: ${movie.rating}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Release Date: ${movie.releaseDate}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Runtime: ${movie.runtime} minutes',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  movie.overview,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  'Genres: ${movie.genres.join(", ")}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
