import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/Top_Movies/data/model/genre_model.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/TopMovies_Cubit/top_movies_cubit.dart';
import 'package:movies_app/features/Top_Movies/presentation/manager/geners_Cubit/geners_cubit.dart';

import '../../../../../core/utils/styles.dart';

class GenerListView extends StatefulWidget {
  const GenerListView({super.key, this.selectedGenre = 28});
  final int selectedGenre;

  @override
  State<GenerListView> createState() => _GenerListViewState();
}

class _GenerListViewState extends State<GenerListView> {
  late int selectedGenre;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenersCubit, GenersState>(
      builder: (context, state) {
        if (state is GenersSuccess) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
                itemCount: state.genre.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Genre genre = state.genre[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Genre genre = state.genre[index];
                          selectedGenre = genre.id!;
                          BlocProvider.of<TopMoviesCubit>(context)
                              .fetchMoviesByGenre(selectedGenre);
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 3.55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: genre.id == selectedGenre
                              ? const Color.fromARGB(255, 121, 98, 224)
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            state.genre[index].name!,
                            style: Styles.style20,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is GenersFailure) {
          return const Center(
            child: Text('Somthing wrong'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
