
import 'package:get/get.dart';
import 'package:movielist_application/model/data_movieDetail.dart';
import 'package:movielist_application/model/data_movieList.dart';
import 'package:movielist_application/repository/movie_repository.dart';

class Movie_Controller extends GetxController {
  static Movie_Controller get to => Get.find();
  final MovieRepository _movieRepository = Get.put(MovieRepository());

  RxString searchTxt = "".obs;
  RxInt pageCnt = 1.obs;
  RxList<data_movieList> dwb = <data_movieList>[].obs;

  RxBool fetchMore = false.obs;
  RxBool isLoading = false.obs;

  Future<void> getMovieList({ required String txt }) async {
    fetchMore.value = true;
    isLoading.value = true;
    _movieRepository.getList(txt, pageCnt.value).then((value) {
      fetchMore.value = false;
      isLoading.value = false;
      if(value != null){
        if(value.Response == 'True'){
          dwb.addAll(value.search!);
          pageCnt.value++;
        } else {
          Get.snackbar('Error', value.Error.toString());
        }
      } else {
        Get.snackbar('Error', 'Server or Network Error');
      }
    });
  }
  
  Future<data_movieDetail> getMovieDetail(String idx) async{
    isLoading.value = true;
    return await _movieRepository.getDetail(idx);
  }

  initData() {
    pageCnt.value = 1;
    dwb.clear();
  }
}