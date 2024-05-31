import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/model/data_movieDetail.dart';

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
          Container(
            width: disp_width,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text('TITLE: ${movie.Title!}',
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: movie.Poster!.length > 10 ?
                Image.network(
                  movie.Poster!, width: (disp_width-30)/3, height: 150, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                        width: (disp_width-30)/2, height: 150, color: Colors.blueGrey,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported_sharp, color: Colors.black38, size: 40,)
                    );
                  },
                ):
                Container(
                    width: (disp_width-30)/3, height: 150, color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.tv_sharp, color: Colors.black38, size: 40,)
                ),
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
        ]
      ),
    );
  }
}
