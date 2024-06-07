import 'dart:math';

import 'package:facetime/screen/cam_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80.0,
          ),
          child: Center(
            child: Column(
              children: [
                _Text(),
                Expanded(child: SizedBox()),
                _Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hello',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
          ),
        ),
        SizedBox(height: 8.0,),
        Text(
          'iPhone',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => CamScreen(), ),
          );
        },
        child: Center(
          child: Icon(
            Icons.call,
            size: 30.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF76D674),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
