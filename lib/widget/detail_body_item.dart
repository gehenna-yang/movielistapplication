import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ratingsList(list: movie.Ratings!),
    );
  }
}

ratingsList({ List<ratings>? list}) {
  List<Widget> lw = [];

  if(list == null){
    return;
  }

  for(int a = 0; a<list.length; a++){
    lw.add(const SizedBox(width: 15));
    lw.add(Column(
        children: [
          metronomeColorParse(list[a]),
          const SizedBox(height: 5 ),
          textBox(list[a].Source),
          const SizedBox(height: 5 ),
          Text(list[a].Value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
        ],
      )
    );
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: lw,
  );
}

Widget metronomeColorParse(ratings value) {
  if(value.Source.contains('Database')) {
    if(double.parse(value.Value.split('/')[0]) >= 5.0 && double.parse(value.Value.split('/')[0]) < 7.5) {
      return const Icon(CupertinoIcons.metronome, color: Colors.amber, size: 50,);
    } else if (double.parse(value.Value.split('/')[0]) >= 7.5) {
      return const Icon(CupertinoIcons.metronome, color: Colors.green, size: 50,);
    } else {
      return const Icon(CupertinoIcons.metronome, color: Colors.deepOrange, size: 50,);
    }
  } else if (value.Source.contains('Tomato')) {
    if(int.parse(value.Value.split('%')[0]) >= 50 && int.parse(value.Value.split('%')[0]) < 75) {
      return const Icon(CupertinoIcons.metronome, color: Colors.amber, size: 50,);
    } else if (int.parse(value.Value.split('%')[0]) >= 75) {
      return const Icon(CupertinoIcons.metronome, color: Colors.green, size: 50,);
    } else {
      return const Icon(CupertinoIcons.metronome, color: Colors.deepOrange, size: 50,);
    }
  } else {
    if(double.parse(value.Value.split('/')[0]) >= 50 && double.parse(value.Value.split('/')[0]) < 75) {
      return const Icon(CupertinoIcons.metronome, color: Colors.amber, size: 50,);
    } else if (double.parse(value.Value.split('/')[0]) >= 75) {
      return const Icon(CupertinoIcons.metronome, color: Colors.green, size: 50,);
    } else {
      return const Icon(CupertinoIcons.metronome, color: Colors.deepOrange, size: 50,);
    }
  }
}

Widget textBox(String Source){
  String value = '';
  if(Source.contains('Database')) {
    value = 'IMD Ratings';
  } else {
    value = Source;
  }
  return Container(
    width: disp_width/4,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),),
        ),
      ],
    ),
  );
}
