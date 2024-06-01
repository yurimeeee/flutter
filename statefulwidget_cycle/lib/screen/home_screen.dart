import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (show)
              GestureDetector(
                onTap: (){
                  setState(() {
                    color = color == Colors.blue ? Colors.red : Colors.blue;
                  });
                },
                child: CodeFactoryWidget(
                  color: color,
                ),
              ),
            SizedBox(height: 32.0),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    // show = show ? false : true;
                    show = !show;
                  });
                },
                child: Text('클릭해서 보이기/안보이기'))
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  final Color color;

  CodeFactoryWidget({
    super.key,
    required this.color,
  }) {
    print('1) stateful widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2) stateful widget Create state');
    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  @override
  void initState() {
    print('3) stateful widget initState');
    super.initState(); // 부모의 initState 실행
  }

  @override
  void didChangeDependencies() {
    print('4) stateful widget didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5) stateful widget build');
    return Container(
      color: widget.color,
      height: 50.0,
      width: 50.0,
    );
  }

  @override
  void deactivate() {
    print('6) stateful widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7) stateful widget dispose');
    super.dispose();
  }
}
