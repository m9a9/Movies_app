import 'package:flutter/material.dart';

class TrendingActorsListView extends StatelessWidget {
  const TrendingActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepOrange,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1681654489724-df39cc108524?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
              child: Text(' Name'));
        },
      ),
    );
  }
}
