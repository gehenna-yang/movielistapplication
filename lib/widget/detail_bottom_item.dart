import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
import 'package:movielist_application/model/data_movieDetail.dart';
import 'package:movielist_application/widget/detail_header_item.dart';

class DetailBottomItem extends StatelessWidget {
  DetailBottomItem({
    super.key,
    required this.movie,
  });
  data_movieDetail movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          partLine(),
          textLineParse('Genre', movie.Genre!),
          const SizedBox(height: 15,),
          textLineParse('Plot', movie.Plot!),
          const SizedBox(height: 15,),
          textLineParse('Awards', movie.Awards!),
          const SizedBox(height: 15,),
          textLineParse('Actors', movie.Actors!),
          const SizedBox(height: 15,),
          textLineParse('Language', movie.Language!),
          const SizedBox(height: 15,),
          textLineParse('DVD', movie.DVD!),
        ],
      ),
    );
  }
}

Widget textLineParse(String title, String content) {
  return Container(
    width: disp_width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text( title,
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
        ),
        Flexible(
          child: Text(content,
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16)),
        ),
      ],
    ),
  );
}
