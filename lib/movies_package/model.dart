class Movie {
  final String title;
  final String overview;
  final String releaseDate;
  final String imageUrl;
  final double rating;
  final int runtime;
  final List<String> genres;

  Movie({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.imageUrl,
    required this.rating,
    required this.runtime,
    required this.genres,
  });
}
