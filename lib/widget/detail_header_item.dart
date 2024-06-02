import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/model/data_movieDetail.dart';
import 'package:movielist_application/view/posterView.dart';
import 'package:page_transition/page_transition.dart';

class DetailHeaderItem extends StatelessWidget {
  DetailHeaderItem({
    super.key,
    required this.movie
  });
  data_movieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: disp_width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          partLine(),
          Container(
            width: disp_width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TITLE :', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 20)),
                const SizedBox(width: 5,),
                Flexible(
                  child: Text(movie.Title!,
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          partLine(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      PageTransition(
                          child: PosterView(imgUrl: movie.Poster!),
                          type: PageTransitionType.leftToRightWithFade
                      )
                  );
                },
                child: Hero(
                  tag: 'Poster',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: movie.Poster!.length > 10 ?
                    Image.network(
                      movie.Poster!, width: (disp_width-30)/3, height: 160, fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                            width: (disp_width-30)/3, height: 160, color: Colors.blueGrey,
                            alignment: Alignment.center,
                            child: const Icon(Icons.image_not_supported_sharp, color: Colors.black38, size: 40,)
                        );
                      },
                    )
                        : Container(
                        width: (disp_width-30)/3, height: 160, color: Colors.blueGrey,
                        alignment: Alignment.center,
                        child: const Icon(Icons.tv_sharp, color: Colors.black38, size: 40,)
                    ),
                  ),
                )
              ),
              const SizedBox(width: 10),
              Container(
                width: (disp_width-30)/3*2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    Text( 'Released: ${movie.Released}',
                        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 10,),
                    Text( 'Runtime: ${movie.Runtime}',
                        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 10,),
                    Text( 'BoxOffice: ${movie.BoxOffice}',
                        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 10,),
                    Text( 'Director: ${movie.Director}',
                        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                    const SizedBox(height: 10,),
                    Text( 'Writer: ${movie.Writer}',
                        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
                  ],
                ),
              )
            ],
          ),
          partLine(),
        ]
      ),
    );
  }
}

Widget partLine(){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    width: disp_width, height: 1,
    color: Colors.blueGrey,
  );
}
