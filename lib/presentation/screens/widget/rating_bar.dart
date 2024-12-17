import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required double rate}) : rate = rate / 2;

  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          final starIndex = index + 1;
          if (rate >= starIndex) {
            return const Icon(Icons.star_rounded, color: Colors.yellow, size: 30);
          } else if (rate > starIndex - 1 && rate < starIndex) {
            return const Icon(Icons.star_half_rounded, color: Colors.yellow, size: 30);
          } else {
            return const Icon(Icons.star_border_rounded, color: Colors.yellow, size: 30);
          }
        },
      ),
    );
  }
}
