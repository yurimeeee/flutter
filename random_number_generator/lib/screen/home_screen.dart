import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_to%20_image.dart';
import 'package:random_number_generator/constant/color.dart';
import 'dart:math';

import 'package:random_number_generator/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];
  int maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(onPressed: onSettingIconPressed),
            _Body(numbers: numbers),
            _Footer(onPressed: generateRandomNumber),
          ],
        ),
      ),
    );
  }

/*
stateless 위젯은 전역으로 클래스안에서 컨텍스트 접근 불가,
stateful 위젯은 클래스 내부에서는 전역적으로 컨텍스트 접근 가능
*/
  onSettingIconPressed() async{
   final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        //각 스크린 간 데이터를 주고 받아야함
        //builder 함수는 대부분 빌드컨텍스틑를 제공하고 원하는 위젯을 렌더링
        return SettingScreen(maxNumber: maxNumber);
      }),
    );
   maxNumber = result;
  }

  generateRandomNumber() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length < 3) {
      final randomNumber = rand.nextInt(maxNumber);

      newNumbers.add(randomNumber);
    }
    setState(() {
      numbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '랜덤 숫자 생성기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            color: redColor,
            icon: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final List<int> numbers;

  const _Body({
    super.key,
    required this.numbers,
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.numbers.map((e) => NumberToImage(number: e)).toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('생성하기'),
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
