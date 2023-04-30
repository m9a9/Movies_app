import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class BuildActorItem extends StatelessWidget {
  const BuildActorItem({super.key, required this.imageUrl, this.actorName});
  final String imageUrl;
  final String? actorName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
          placeholder: ((context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.deepOrange,
              ))),
          errorWidget: (context, url, error) => Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_not_found.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Text(
          actorName ?? '',
          style: Styles.style14,
        ),
      ],
    );
  }
}
