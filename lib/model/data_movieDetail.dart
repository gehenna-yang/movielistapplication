
class data_movieDetail{
  data_movieDetail({
    required this.Response,
    this.Error,
    this.Title,
    this.Year,
    this.imdbID,
    this.Type,
    this.Poster,
    this.Rated,
    this.Released,
    this.Runtime,
    this.Genre,
    this.Director,
    this.Writer,
    this.Actors,
    this.Plot,
    this.Language,
    this.Country,
    this.Awards,
    this.Ratings,
    this.Metascore,
    this.imdbRating,
    this.imdbVotes,
    this.DVD,
    this.BoxOffice,
    this.Website,
    this.Production
});
  String? Title;
  String? Year;
  String? imdbID;
  String? Type;
  String? Poster;
  String? Rated;
  String? Released;
  String? Runtime;
  String? Genre;
  String? Director;
  String? Writer;
  String? Actors;
  String? Plot;
  String? Language;
  String? Country;
  String? Awards;
  List<ratings>? Ratings;
  String? Metascore;
  String? imdbRating;
  String? imdbVotes;
  String? DVD;
  String? BoxOffice;
  String? Production;
  String? Website;
  String Response;
  String? Error;

  factory data_movieDetail.fromJson(Map<String, dynamic> json) => data_movieDetail(
    Response: json['Response'],
    Error: json['Error'],
    Title: json['Title'],
    Year: json['Year'],
    imdbID: json['imdbID'],
    Type: json['Type'],
    Poster: json['Poster'],
    Rated: json['Rated'],
    Released: json['Released'],
    Runtime: json['Runtime'],
    Genre: json['Genre'],
    Director: json['Director'],
    Writer: json['Writer'],
    Actors: json['Actors'],
    Plot: json['Plot'],
    Language: json['Language'],
    Country: json['Country'],
    Awards: json['Awards'],
    Ratings: json['Ratings'] == null ? null : List<ratings>.from(json['Ratings'].map((e) => ratings.fromJson(e))),
    Metascore: json['Metascore'],
    imdbRating: json['imdbRating'],
    imdbVotes: json['imdbVotes'],
    DVD: json['DVD'],
    BoxOffice: json['BoxOffice'],
    Production: json['Production'],
    Website: json['Website'],
  );
}

class ratings {
  ratings({
    required this.Source,
    required this.Value,
  });
  String Source;
  String Value;

  factory ratings.fromJson(Map<String, dynamic> json) => ratings(
    Source: json['Source'],
    Value: json['Value']
  );
}