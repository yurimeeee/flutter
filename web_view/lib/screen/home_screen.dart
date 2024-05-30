import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 웹뷰에 들어갈 주소
final homeUrl = Uri.parse('https://blog.codefactory.ai/');

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);
  //웹뷰 컨트롤러의 인스턴스가 아닌 loadRequest의 반환값이 나오기에 loadRequest 앞에 .. 점 두개
  // 점 두개 이유> 함수를 실행하는데 함수의 결과 값을 반환하는 것이 아닌 함수를 실행한 대상을 반환

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('code factory'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            controller.loadRequest(homeUrl);
            // print('pressed');
          }, icon: Icon(
            Icons.home,
          ))
        ],
      ),
      body: WebViewWidget(
        // 웹뷰 위젯 안에서 어떤 웹사이트를 보여줄지 정함
        controller: controller,
      ),
    );
  }
}

