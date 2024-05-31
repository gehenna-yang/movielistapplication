
class data_search {
  data_search({
    required this.Response,
    this.totalResults,
    this.search,
    this.Error,
  });
  String Response;
  String? totalResults;
  String? Error;
  List<data_movieList>? search;

  factory data_search.fromJson(Map<String, dynamic> json) => data_search(
    Response: json['Response'],
    totalResults: json['totalResults'],
    Error: json['Error'],
    search: json['Search'] == null ? null : List<data_movieList>.from(json['Search'].map((e) => data_movieList.fromJson(e))),
  );
}

class data_movieList {
  data_movieList({
    required this.Title,
    required this.Year,
    required this.imdbID,
    required this.Type,
    required this.Poster
  });
  String Title;
  String Year;
  String imdbID;
  String Type;
  String Poster;

  factory data_movieList.fromJson(Map<String, dynamic> json) => data_movieList(
      Title: json['Title'],
      Year: json['Year'],
      imdbID: json['imdbID'],
      Type: json['Type'],
      Poster: json['Poster'],
  );

}