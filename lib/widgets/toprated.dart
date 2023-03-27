import 'package:flutter/material.dart';
import 'package:movie_sample/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;
  const TopRatedMovies({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies',
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
              itemCount: topRated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
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
                                    topRated[index]['poster_path']),
                          )),
                        ),
                        Container(
                          child: ModifiedText(
                            text: topRated[index]['title'] ?? 'Loading',
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
