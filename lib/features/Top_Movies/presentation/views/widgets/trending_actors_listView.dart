import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/TrendingActors_Cubit/trending_actors_cubit.dart';
import 'actor_item.dart';

class TrendingActorsListView extends StatelessWidget {
  const TrendingActorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingActorsCubit, TrendingActorsState>(
      builder: (context, state) {
        if (state is TrendingActorsSuccess) {
          return AspectRatio(
            aspectRatio: 4 / 1.5,
            child: ListView.builder(
              itemCount: state.Actors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BuildActorItem(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w200${state.Actors[index].profilePath}',
                  actorName: '${state.Actors[index].name}',
                );
              },
            ),
          );
        } else if (state is TrendingActorsFailure) {
          return const Center(
            child: Text('Something went wrong,try later'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
      },
    );
  }
}
