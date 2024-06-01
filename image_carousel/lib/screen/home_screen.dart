import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    timer  = Timer.periodic(Duration(seconds: 2), (timer){
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if(nextPage > 4){
        nextPage = 0; //마지막 페이지에서 다시 처음으로
      }

      controller.animateToPage(nextPage, duration: Duration(seconds: 1), curve: Curves.linear,);
    });

  }

  @override
  void dispose() {
    if(timer != null){
      timer!.cancel();
    }

    controller.dispose();
    // 컨트롤러 삭제. 무한으로 실행되어 메모리를 너무 많이 사용할 수 있으므로 controller, timer 사용시에는 dispose 처리 꼭 해줘야함

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1,2,3,4,5].map((e)=> Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover,)).toList(),
      )
    );
  }
}
