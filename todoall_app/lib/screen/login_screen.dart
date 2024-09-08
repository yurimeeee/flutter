import 'package:flutter/material.dart';
import 'package:todoall_app/themes /theme_data.dart';
import 'package:antd_mobile/antd_mobile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                // Image.asset('asset/img/todoall_Logo.png'),

                Text(
                  '로그인',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 32),
                AntInput(controller: controller),
                AntButton(
                  child: const Text('Button'),
                  onClick: () {
                    // do something
                  },
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
