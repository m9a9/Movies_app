import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class GenerListView extends StatelessWidget {
  const GenerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent,
                ),
                child: Center(
                  child: Text(
                    'Genre Name',
                    style: Styles.style18,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
