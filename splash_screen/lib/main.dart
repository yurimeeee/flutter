import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: HomeScreen()),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF64adf5),
        body: Padding(
          padding: EdgeInsets.symmetric(
            //대칭의 패딩 설정
            horizontal: 32.0,
            vertical: 10,
          ),
          child: Column(
            //세로로 children안의 요소 배치
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/img/logo.png',
              ),
              SizedBox(
                height: 28.0,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        )

        // Center(child: Image.asset('asset/img/logo.png'),)
        );
  }
}

//StatelessWidget
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF64adf5),
//         body: Column(
//           //세로로 children안의 요소 배치
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'asset/img/logo.png',
//             ),
//             CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           ],
//         )
//
//         // Center(child: Image.asset('asset/img/logo.png'),)
//         );
//   }
// }
