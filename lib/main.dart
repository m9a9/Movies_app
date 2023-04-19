import 'package:flutter/material.dart';

import 'features/Top_Movies/presentation/views/home_page_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}
