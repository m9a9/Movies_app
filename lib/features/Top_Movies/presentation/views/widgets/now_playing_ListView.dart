import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';

class NowPlayingListView extends StatelessWidget {
  const NowPlayingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1681836695952-1f8073a7938d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                            ),
                            fit: BoxFit.cover),
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Text(
                    'Movie Name',
                    style: Styles.style18,
                  ),
                  Text('rating', style: Styles.style18)
                ],
              ),
            );
          }),
    );
  }
}
