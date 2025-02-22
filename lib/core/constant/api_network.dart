class ApiNetwork {
  static const baseUrl = "https://api.themoviedb.org/3/";
  static const apiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhM2YyMzQ3NTU1YjBiMzc5NWY2OTQxYWQxNTUyMDhlZCIsIm5iZiI6MTczNjUwOTAyNS4zNTIsInN1YiI6IjY3ODEwNjYxMTI2Njc5Njg4NTRlYzgyMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NZtUyccm0KUnMPEZKZxeSfMCTrOo9yLaEcX1WzRpDJA";

  // ~ Query Area
  static const topRated = "movie/top_rated?language=en-US&page=1";
  static const popular = "movie/popular?language=en-US&page=1";

  //  ~ Method Quary Area
  static String searchMovie(String movieName, {String page = "1"}) {
    return "search/movie?query=$movieName&page=$page";
  }

  static String searchByLanguage(String language, String year,
      {String page = "1"}) {
    return "discover/movie?language=en-US&sort_by=popularity.desc&page=$page&primary_release_year=$year&with_original_language=$language";
  }
}
