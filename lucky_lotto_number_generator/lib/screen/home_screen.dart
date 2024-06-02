import 'package:flutter/material.dart';
import 'package:lucky_lotto_number_generator/const/colors.dart';
import 'package:lucky_lotto_number_generator/screen/number_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  100.0,
                  0,
                  0,
                ),
                child: Text(
                  '행운의 로또번호 생성기',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'asset/img/lotto.png',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return NumberScreen();
                    }),
                  );
                },
                child: Text('번호 생성'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
