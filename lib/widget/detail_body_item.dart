import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielist_application/model/data_movieDetail.dart';

class DetailBodyItem extends StatelessWidget {
  DetailBodyItem({
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratingsList(list: movie.Ratings!),
            ],
          ),
          const SizedBox(height: 20,),
          Text( 'Genre: ${movie.Genre}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text( 'Awards: ${movie.Awards}',
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text( 'Actors: ${movie.Actors}',
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Text( 'DVD: ${movie.DVD}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 5,),
          Text( 'Language: ${movie.Language}', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text( 'Plot: ${movie.Plot}',
                    style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 16)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

ratingsList({ List<ratings>? list}) {
  List<Widget> lw = [];

  if(list == null){
    return;
  }

  for(int a = 0; a<list.length; a++){
    lw.add(const SizedBox(height: 15));
    lw.add(Column(
        children: [
          const Icon(CupertinoIcons.metronome, color: Colors.deepOrange, size: 50,),
          const SizedBox(height: 5 ),
          Text(list[a].Source, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
          const SizedBox(height: 5 ),
          Text(list[a].Value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
        ],
      )
    );
  }

  return Column(
    children: lw,
  );
}
