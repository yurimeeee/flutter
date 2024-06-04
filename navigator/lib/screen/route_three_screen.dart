import 'package:flutter/material.dart';
import 'package:navigator/layout/default_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(children: [
      Text('arguments : ${arguments.toString()}', textAlign: TextAlign.center,),
      OutlinedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('pop'),
      ),
    ], title: 'RouteThreeScreen');
  }
}
