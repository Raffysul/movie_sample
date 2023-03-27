import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movies_package/movie_provider.dart';
import 'movies_package/movie_screen.dart';
/*import 'package:movie_sample/utils/text.dart';
import 'package:movie_sample/widgets/toprated.dart';
import 'package:movie_sample/widgets/trending.dart';
import 'package:movie_sample/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('FORD v FERRARI'),
          ),
          body: const MovieScreen(),
        ),
      ),
    );
  }
}

//   MaterialApp(
//   debugShowCheckedModeBanner: false,
//   title: 'Flutter Demo',
//   theme: ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.blue,
//   ),
//   home: const HomePage(),
// );

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MovieProvider(),
//       child: MaterialApp(
//         title: 'TMDB Movie',
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('TMDB Movie'),
//           ),
//           body: const MovieScreen(),
//         ),
//       ),
//     );
//   }
// }

/*class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.movie == null) {
            return const CircularProgressIndicator();
          }

          final Movie movie = movieProvider.movie!;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                movie.imageUrl,
                height: 300,
              ),
              const SizedBox(height: 16),
              Text(
                movie.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
          );
        },
      ),
    );
  }
}*/

/*class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = 'e46116d17f95c5f29ed7ce0408bce9a5';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDYxMTZkMTdmOTVjNWYyOWVkN2NlMDQwOGJjZTlhNSIsInN1YiI6IjY0MWMzNmQxZDc1YmQ2MjQzZTRmN2JjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.79H97FGxyfCmnoxwQOPV7xAia8lVH3NZoUy6U6GR9-A';

  loadMovies() async {
    final TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(tv);
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const ModifiedText(
          text: 'Flutter Movie App',
          color: Colors.green,
          size: 15,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRatedMovies(topRated: topRatedMovies),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}*/
