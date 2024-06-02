import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:lucky_lotto_number_generator/const/colors.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  List<int> numbers = [0, 0, 0, 0, 0, 0];
  int maxNumber = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  20.0,
                  0,
                  0,
                ),
                child: Text(
                  '행운의 숫자',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              _Numbers(numbers: numbers),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: numbers.join(', ')));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('클립보드에 복사되었습니다.'),
                    ),
                  );
                  // Fluttertoast.showToast(
                  //     msg: "This is Center Short Toast",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: fontColor,
                  //     fontSize: 16.0
                  // );
                },
                icon: Icon(Icons.copy),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: generateRandomNumber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('다시하기'),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(Icons.rotate_left),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('홈으로'),
                        SizedBox(
                          width: 8.0,
                        ),
                        Icon(Icons.home_outlined),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: fontColor,
                      foregroundColor: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // generateRandomNumber() {
  //   final rand = Random();
  //   final Set<int> newNumbers = {};
  //
  //   while (numbers.length < 6) {
  //     final randomNumber = rand.nextInt(maxNumber);
  //
  //     newNumbers.add(randomNumber);
  //     print('numbers $newNumbers');
  //   }
  //   setState(() {
  //     numbers = newNumbers.toList();
  //   });
  // }
  generateRandomNumber() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length < 6) {
      final randomNumber =
          rand.nextInt(maxNumber) + 1; // Generate numbers from 1 to maxNumber
      newNumbers.add(randomNumber);
    }

    setState(() {
      numbers = newNumbers.toList();
    });
  }
}

const List<Color> circleColors = [
  Color(0xFFFFA1EA),
  Color(0xFFF7D149),
  Color(0xFFFFC887),
  Color(0xFFA0E190),
  Color(0xFF7ECFCA),
  Color(0xFF85C4F2),
];

class _Numbers extends StatefulWidget {
  final List<int> numbers;
  const _Numbers({
    super.key,
    required this.numbers,
  });

  @override
  State<_Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<_Numbers> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.numbers
            .map(
              (e) => CircleWithText(
                text: e.toString(),
                circleColor: circleColors[Random().nextInt(6)],
                textColor: Colors.white,
              ),
            )
            .toList(),
      ),
    );
  }
}

class CircleWithText extends StatelessWidget {
  final String text;
  final Color circleColor;
  final Color textColor;

  const CircleWithText({
    Key? key,
    required this.text,
    required this.circleColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24.0, // adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
