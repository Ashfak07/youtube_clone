import 'package:flutter/material.dart';

class SubscriptionCustomContainer extends StatelessWidget {
  const SubscriptionCustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey),
              ),
            ),
            Positioned(
              right: 10,
              top: 70,
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue),
              ),
            ),
          ],
        ),
        Text('hello')
      ],
    );
  }
}
