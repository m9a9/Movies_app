import 'package:flutter/material.dart';

class TopMoviesListViewItem extends StatelessWidget {
  const TopMoviesListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrange,
          image:
              DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageUrl))),
      child: const Center(
        child: Text('Movie Name'),
      ),
    );
  }
}
