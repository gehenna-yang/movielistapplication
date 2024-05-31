
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movielist_application/model/data_movieDetail.dart';
import 'package:movielist_application/model/data_movieList.dart';

class MovieRepository extends GetConnect {
  static MovieRepository get to => Get.find();
  
  Future<data_search?> getList(String txt, int pg) async {
    
    var res = await http.get(Uri.parse('https://www.omdbapi.com/?apikey=c1486c4e&s=$txt&page=$pg&type=movie'));

    if(res.statusCode == 200){
      var jsonObj = json.decode(res.body);
      return data_search.fromJson(jsonObj);
    }
  }

  Future<data_movieDetail> getDetail(String idx) async {

    var res = await http.get(Uri.parse('https://www.omdbapi.com/?apikey=c1486c4e&i=$idx'));

    if(res.statusCode == 200){
      var jsonObj = json.decode(res.body);
      return data_movieDetail.fromJson(jsonObj);
    } else {
      return data_movieDetail(Response: 'False', Error: 'Server or Network Error');
    }
  }
}