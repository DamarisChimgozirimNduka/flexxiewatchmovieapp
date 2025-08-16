class DataBase {
  final List<MovieName> movieNames;
  final List<MostWatched> mostWatched;
  final List<AllMovie> allMovies;
  final List<Favourite> favourites;

  DataBase({
    required this.movieNames,
    required this.mostWatched,
    required this.allMovies,
    required this.favourites,
  });

  factory DataBase.fromJson(Map<String, dynamic> json) {
    return DataBase(
      movieNames: (json['MovieName'] as List? ?? [])
          .map((item) => MovieName.fromJson(item))
          .toList(),
      mostWatched: (json['Mostwatched'] as List? ?? [])
          .map((item) => MostWatched.fromJson(item))
          .toList(),
      allMovies: (json['Allmovie'] as List? ?? [])
          .map((item) => AllMovie.fromJson(item))
          .toList(),
      favourites: (json['Favourite'] as List? ?? [])
          .map((item) => Favourite.fromJson(item))
          .toList(),
    );
  }
}

class MovieName {
  final int id;
  final String title;

  MovieName({required this.id, required this.title});

  factory MovieName.fromJson(Map<String, dynamic> json) {
    return MovieName(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled',
    );
  }
}

class MostWatched {
  final int id;
  final int catId;
  final String title;
  final String image;
  final String description;
  final String movielink;
  final String video;

  MostWatched({
    required this.id,
    required this.catId,
    required this.title,
    required this.image,
    required this.description,
    required this.movielink,
    required this.video,
  });

  factory MostWatched.fromJson(Map<String, dynamic> json) {
    return MostWatched(
      id: json['id'] as int? ?? 0,
      catId: json['catId'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled',
      image: json['image'] as String? ?? 'default_poster.png',
      description: json['description'] as String? ?? 'No description available',
      video: json['video'] as String? ?? "No video available ",
      movielink: json['movielink'] as String? ?? '',
    );
  }
}

class AllMovie {
  final int id;
  final int catId;
  final String title;
  final String image;
  final String movielink;
  final String video;
  final String description;

  AllMovie({
    required this.id,
    required this.catId,
    required this.title,
    required this.image,
    required this.movielink,
    required this.video,
    required this.description,
  });

  factory AllMovie.fromJson(Map<String, dynamic> json) {
    return AllMovie(
      id: json['id'] as int? ?? 0,
      catId: json['catId'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled',
      image: json['image'] as String? ?? 'default_poster.png',
      movielink: json['movielink'] as String? ?? '',
      video: json['video'] as String? ?? "No video available ",
      description: json['description'] as String? ?? 'No description available',
    );
  }
}

class Favourite {
  final int id;
  final int catId;
  final String title;
  final String image;
  final String movielink;
  final String video;
  final String description;

  Favourite({
    required this.id,
    required this.catId,
    required this.title,
    required this.image,
    required this.movielink,
    required this.video,
    required this.description,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['id'] as int? ?? 0,
      catId: json['catId'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled',
      image: json['image'] as String? ?? 'default_poster.png',
      movielink: json['movielink'] as String? ?? '',
      video: json['video'] as String? ?? '',
      description: json['description'] as String? ?? 'No description available',
    );
  }
}
