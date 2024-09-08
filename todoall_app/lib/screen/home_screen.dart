import 'package:flutter/material.dart';
import 'package:todoall_app/screen/login_screen.dart';
import 'package:todoall_app/themes /theme_data.dart';
import 'package:antd_mobile/antd_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFD),
      body: SafeArea(
        // Center(
        child: Center(
            child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centers content horizontally
          children: [
            Image.asset('asset/img/todoall_Logo.png'),
            SizedBox(height: 48),
            Text(
              '투두 올은 할 일을 기록하는 데일리 앱으로',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '당신의 효율적인 라이프를 위한 일정관리를 함께합니다.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('시작하기'),
            ),
          ],
        )),
      ),
    );
  }
}
