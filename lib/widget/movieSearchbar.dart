import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/controller/movie_controller.dart';

class MovieSearchBar extends StatelessWidget {
  MovieSearchBar({
    Key? key,
    required this.movieController,
    required this.search_controller,
  }) : super(key: key);
  Movie_Controller movieController;
  TextEditingController search_controller;

  // final TextEditingController search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: disp_width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(style: BorderStyle.solid, width: 1.5, color: Colors.indigo),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.search,
                controller: search_controller,
                autofocus: false,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0,5,0,15),
                ),
                style: const TextStyle(color: Colors.black, fontSize: 15,),
                onChanged: (String value) {
                  movieController.searchTxt.value = value;
                },
                onFieldSubmitted: (String value) {
                  movieController.initData();
                  movieController.getMovieList(txt: value);
                },
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              child: const Icon(Icons.search, color: Colors.indigo, size: 25),
              onTap: () {
                movieController.initData();
                movieController.getMovieList(txt: movieController.searchTxt.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
