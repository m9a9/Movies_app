import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/genre_listView.dart';
import 'package:movies_app/features/Top_Movies/presentation/views/widgets/now_playing_ListView.dart';

class PlayingNowView extends StatelessWidget {
  const PlayingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GenerListView(),
        Text(
          'NOW Playing',
          style: Styles.style18,
        ),
        const NowPlayingListView(),
      ],
    );
  }
}
