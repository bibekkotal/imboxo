class MovieTrailerResponse {
  MovieTrailerResponse({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  final int status;
  final int success;
  final String message;
  final List<TrailerItem> data;

  factory MovieTrailerResponse.fromJson(Map<String, dynamic> json) {
    return MovieTrailerResponse(
      status: json["status"] ?? 0,
      success: json["success"] ?? 0,
      message: json["message"] ?? "",
      data:
          json["data"] == null
              ? []
              : List<TrailerItem>.from(
                json["data"]!.map((x) => TrailerItem.fromJson(x)),
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data.map((x) => x?.toJson()).toList(),
  };
}

class TrailerItem {
  TrailerItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbnail,
    required this.poster,
    required this.hashThumbnail,
    required this.hashPoster,
    required this.trailer,
  });

  final int id;
  final String name;
  final String slug;
  final String thumbnail;
  final String poster;
  final String hashThumbnail;
  final String hashPoster;
  final String trailer;

  factory TrailerItem.fromJson(Map<String, dynamic> json) {
    return TrailerItem(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      poster: json["poster"] ?? "",
      hashThumbnail: json["hash_thumbnail"] ?? "",
      hashPoster: json["hash_poster"] ?? "",
      trailer: json["trailer"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "thumbnail": thumbnail,
    "poster": poster,
    "hash_thumbnail": hashThumbnail,
    "hash_poster": hashPoster,
    "trailer": trailer,
  };
}

class MovieListResponse {
  MovieListResponse({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  final int status;
  final int success;
  final String message;
  final List<MovieListItem> data;

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      status: json["status"] ?? 0,
      success: json["success"] ?? 0,
      message: json["message"] ?? "",
      data:
          json["data"] == null
              ? []
              : List<MovieListItem>.from(
                json["data"]!.map((x) => MovieListItem.fromJson(x)),
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "message": message,
    "data": data.map((x) => x?.toJson()).toList(),
  };
}

class MovieListItem {
  MovieListItem({
    required this.id,
    required this.access,
    required this.name,
    required this.slug,
    required this.thumbnail,
    required this.poster,
    required this.hashThumbnail,
    required this.hashPoster,
    required this.releaseDate,
    required this.duration,
    required this.certificate,
    required this.favorite,
  });

  final int id;
  final List<String> access;
  final String name;
  final String slug;
  final String thumbnail;
  final String poster;
  final String hashThumbnail;
  final String hashPoster;
  final int releaseDate;
  final String duration;
  final String certificate;
  final bool favorite;

  factory MovieListItem.fromJson(Map<String, dynamic> json) {
    return MovieListItem(
      id: json["id"] ?? 0,
      access:
          json["access"] == null
              ? []
              : List<String>.from(json["access"]!.map((x) => x)),
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      poster: json["poster"] ?? "",
      hashThumbnail: json["hash_thumbnail"] ?? "",
      hashPoster: json["hash_poster"] ?? "",
      releaseDate: json["release_date"] ?? 0,
      duration: json["duration"] ?? "",
      certificate: json["certificate"] ?? "",
      favorite: json["favorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "access": access.map((x) => x).toList(),
    "name": name,
    "slug": slug,
    "thumbnail": thumbnail,
    "poster": poster,
    "hash_thumbnail": hashThumbnail,
    "hash_poster": hashPoster,
    "release_date": releaseDate,
    "duration": duration,
    "certificate": certificate,
    "favorite": favorite,
  };
}
