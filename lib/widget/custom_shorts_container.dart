import 'package:flutter/material.dart';

class CustomShortsContainer extends StatelessWidget {
  const CustomShortsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey),
      ),
    );
  }
}
