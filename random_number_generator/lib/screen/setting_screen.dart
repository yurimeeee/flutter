import 'package:flutter/material.dart';
import 'package:random_number_generator/component/number_to%20_image.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  final int maxNumber;
  const SettingScreen({super.key, required this.maxNumber,});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Number(maxNumber: maxNumber),
                _Slide(
                  value: maxNumber,
                  onChanged: onSliderChanged,
                ),
                _Button(
                  onpressed: onSavePressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSavePressed() {
    Navigator.of(context).pop(maxNumber.toInt(),);
  }

  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;
  const _Number({
    super.key,
    required this.maxNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: NumberToImage(number: maxNumber.toInt()),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slide({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: redColor,
      onChanged: onChanged,
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onpressed;
  const _Button({
    super.key,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      //     () {
      //   Navigator.of(context).pop();
      // },
      child: Text('저장'),
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, foregroundColor: Colors.white),
    );
  }
}
