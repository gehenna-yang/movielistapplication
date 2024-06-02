import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/controller/movie_controller.dart';
import 'package:movielist_application/widget/movieSearchbar.dart';
import 'package:movielist_application/widget/movie_listview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Movie_Controller movieController = Movie_Controller();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    movieController.initData();
    movieController.searchTxt.value = 'star';
    super.initState();
    movieController.getMovieList(txt: 'star');

    scrollController.addListener(sListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); // 세로로만 UI 표시 설정
    disp_width = MediaQuery.of(context).size.width;
    disp_height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Movie Search', style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MovieSearchBar(
            movieController: movieController,
            search_controller: searchController,
          ),
          const SizedBox(height: 10),
          Expanded(
              child: MovieListView(
                movieController: movieController,
                scrollController: scrollController,
              )
          ),
        ],
      ),
    );
  }

  void sListener() {
    if ((scrollController.position.pixels < scrollController.position.maxScrollExtent-100)
        && (scrollController.position.pixels > scrollController.position.maxScrollExtent-190)) {
      if(scrollController.position.pixels > 0.0 && !movieController.fetchMore.value){
        movieController.getMovieList(txt: movieController.searchTxt.value);
      }
    }
  }
}
