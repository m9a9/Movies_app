import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/playing_now_view.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/top_movies_listView.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/trending_actors_listView.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: [
          const TopMovieListView(),
          const SizedBox(
            height: 15,
          ),
          const PlayingNowView(),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Trending Actors in this Week',
            textAlign: TextAlign.left,
            style: Styles.style18,
          ),
          const SizedBox(
            height: 10,
          ),
          const TrendingActorsListView(),
        ],
      ),
    );
  }
}
