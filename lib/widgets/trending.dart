import 'package:flutter/material.dart';
import 'package:movie_sample/description.dart';
import 'package:movie_sample/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies',
            color: Colors.yellowAccent,
            size: 26,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => Description(
                              name: trending[index]['title'],
                              description: "https://image.tmdb.org/t/p/w500" +
                                  trending[index]['overview'],
                              bannerurl: "https://image.tmdb.org/t/p/w500" +
                                  trending[index]['backdrop_path'],
                              posterurl: "https://image.tmdb.org/t/p/w500" +
                                  trending[index]['poster_path'],
                              vote: "https://image.tmdb.org/t/p/w500${trending[index]['vote_average']}",
                              launch_on: "https://image.tmdb.org/t/p/w500" +
                                  trending[index]['release_date'])),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500" +
                                    trending[index]['poster_path']),
                          )),
                        ),
                        Container(
                          child: ModifiedText(
                            text: trending[index]['title'] ?? 'Loading',
                            color: Colors.purple,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
