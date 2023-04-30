import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TopMoviesListViewItem extends StatelessWidget {
  const TopMoviesListViewItem(
      {super.key, required this.imageUrl, required this.movieName});
  final String imageUrl;
  final String movieName;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageProvider,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.4)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 12),
              child: Text(
                movieName,
                style: Styles.style18
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      placeholder: ((context, url) => const Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ))),
      errorWidget: (context, url, error) =>
          Image.asset('assets/images/img_not_found.jpg'),
    );
  }
}
