import 'package:flutter/material.dart';
import 'package:movielist_application/common/config.dart';

class PosterView extends StatelessWidget {
  PosterView({
    super.key,
    required this.imgUrl,
  });
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Poster', style: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: 'Poster',
            child: Image.network(
              imgUrl, width: disp_width, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                    width: disp_width, color: Colors.blueGrey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported_sharp, color: Colors.black38, size: 40,)
                );
              },
            ),
          ),
        )
      ),
    );
  }
}
