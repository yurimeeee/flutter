import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  final int number;
  const NumberToImage({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (number) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'asset/img/$number.png',
            width: 50.0,
            height: 70.0,
          ),
        ),
      )
          .toList(),
    );
  }
}