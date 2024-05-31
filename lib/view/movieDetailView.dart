import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movielist_application/controller/movie_controller.dart';
import 'package:movielist_application/model/data_movieDetail.dart';
import 'package:movielist_application/widget/detail_body_item.dart';
import 'package:movielist_application/widget/detail_header_item.dart';

class MovieDetailView extends StatefulWidget {
  MovieDetailView({
    super.key,
    required this.movieTitle,
    required this.movieIdx,
  });
  String movieTitle;
  String movieIdx;
  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  final Movie_Controller movieController = Movie_Controller();

  data_movieDetail movie = data_movieDetail(Response: 'False');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.movieTitle, style: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Obx(() =>
          !movieController.isLoading.value ?
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DetailHeaderItem(movie: movie),
                DetailBodyItem(movie: movie),
              ],
            ):
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: CircularProgressIndicator(color: Colors.indigo,),
              ),
            ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    movieController.getMovieDetail(widget.movieIdx).then((value) {
      setState(() {
        movie = value;
      });
      movieController.isLoading.value = false;
    });
  }
}
