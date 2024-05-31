import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movielist_application/controller/movie_controller.dart';
import 'package:movielist_application/widget/movie_item.dart';

class MovieListView extends StatelessWidget {
  MovieListView({
    Key? key,
    required this.movieController,
    required this.scrollController,
  }):super(key: key);

  Movie_Controller movieController;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() =>
          ListView.separated(
            controller: scrollController,
            itemBuilder: (_, i) {
              if(movieController.isLoading.value){
                if(movieController.dwb.length == 0){
                  return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: CircularProgressIndicator(),));
                }else {
                  return i == movieController.dwb.length ?
                    const Center(child: CircularProgressIndicator(),):
                  MovieItem(movie: movieController.dwb[i]);
                }
              } else {
                return MovieItem(movie: movieController.dwb[i]);
              }
            },
            separatorBuilder: (_, i) {
              return const SizedBox(height: 10);
            },
            itemCount: movieController.isLoading.value ?
            (movieController.dwb.length > 0 ? movieController.dwb.length+1:1):movieController.dwb.length
          )
        ),
      // child: Obx(() =>
      //   ListView.separated(
      //     controller: scrollController,
      //     itemBuilder: (_, i) {
      //       return MovieItem(movie: movieController.dwb[i]);
      //     },
      //     separatorBuilder: (_, i) {
      //       return const SizedBox(height: 10);
      //     },
      //     itemCount: movieController.dwb.length
      //   ),
      // )
    );
  }
}
