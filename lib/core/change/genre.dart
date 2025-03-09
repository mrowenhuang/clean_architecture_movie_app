class Genre {

  List<String> genreConverter (List<String> genreId) {
    for (var i = 0; i < genreId.length; i++) {
      switch (genreId[i]) {
        case "28":
          genreId[i] = "Action";
          break;

        case "12":
          genreId[i] = "Adventure";
          break;

        case "16":
          genreId[i] = "Animation";
          break;

        case "35":
          genreId[i] = "Comedy";
          break;

        case "80":
          genreId[i] = "Crime";
          break;

        case "99":
          genreId[i] = "Documentary";
          break;

        case "18":
          genreId[i] = "Drama";
          break;

        case "10751":
          genreId[i] = "Family";
          break;

        case "14":
          genreId[i] = "Fantasy";
          break;

        case "36":
          genreId[i] = "History";
          break;

        case "27":
          genreId[i] = "Horror";
          break;

        case "10402":
          genreId[i] = "Music";
          break;

        case "9648":
          genreId[i] = "Mystery";
          break;

        case "10749":
          genreId[i] = "Romance";
          break;

        case "878":
          genreId[i] = "Science Fiction";
          break;

        case "10770":
          genreId[i] = "TV Movie";
          break;

        case "53":
          genreId[i] = "Thriller";
          break;

        case "10752":
          genreId[i] = "War";
          break;

        case "37":
          genreId[i] = "Western";
          break;

        default:
          print(' invalid entry');
      }
    }

    return genreId;
  }

}