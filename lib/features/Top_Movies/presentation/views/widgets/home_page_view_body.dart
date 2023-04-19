import 'package:flutter/material.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/top_movies_listView.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Column(
        children: const [TopMovieListView()],
      ),
    ));
  }
}
