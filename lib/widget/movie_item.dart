import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/model/data_movieList.dart';
import 'package:movielist_application/view/movieDetailView.dart';
import 'package:page_transition/page_transition.dart';

class MovieItem extends StatelessWidget {
  MovieItem({
    super.key,
    required this.movie,
  });
  data_movieList movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          PageTransition(
            child: MovieDetailView(movieTitle: movie.Title, movieIdx: movie.imdbID),
            type: PageTransitionType.leftToRightWithFade
          )
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE6E6FA),
          border: Border.all(style: BorderStyle.solid, width: 1.5, color: Colors.black54),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: movie.Poster.length > 10 ?
                Image.network(
                  movie.Poster, width: 70, height: 80, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                        width: 70, height: 80, color: Colors.blueGrey,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported_sharp, color: Colors.black38, size: 40,)
                    );
                  },
                )
                : Container(
                    width: 70, height: 80, color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.tv_sharp, color: Colors.black38, size: 40,)
                  ),
            ),
            const SizedBox(width: 10),
            Container(
              width: disp_width-135,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: movie.Title,
                              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            TextSpan(
                              text: ' (${movie.Year})',
                              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
