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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  // MaterialState
                  // hovered - 호버링 상태(마우스 커서를 올려놓은 상태)
                  // focused - 포커스 됐을때(텍스트 볼드)
                  // pressed - 눌렀을때
                  // dragged - 드래그 됐을때
                  // selected - 선택 됐을때 (체크박스, 라디오)
                  // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을때
                  // disabled - 비활성화 됐을때
                  // error - 에러 상태일때
                  backgroundColor: MaterialStateProperty.all(
                Colors.red,
              )),
              child: Text('ElevatedButton'),
            ),
            ElevatedButton(
              onPressed: () {},
              // onPressed: null, //비활성화
              style: ElevatedButton.styleFrom(
                //배경 색
                backgroundColor: Colors.red,
                //비활성화된 버튼 배경색
                disabledBackgroundColor: Colors.grey,
                //비활성화된 버튼 글자색
                disabledForegroundColor: Colors.red,
                //배경 위의 색
                foregroundColor: Colors.white,
                //그림자 색
                shadowColor: Colors.black,
                //버튼 그림자 두께
                elevation: 4,
                textStyle: TextStyle(
                  //폰트 사이즈
                  fontSize: 20.0,
                  //폰트 두께
                  fontWeight: FontWeight.w700,
                ),
                //패딩
                padding: EdgeInsets.all(20.0),
                side: BorderSide(
                    //보더 컬러
                    color: Colors.black,
                    //보더 두께
                    width: 6.0),
                //최소 너비, 높이
                minimumSize: Size(200, 150),
                //최대 너비, 높이
                // maximumSize: Size(100, 100),
                //고정 너비, 높이
                // fixedSize: Size(100, 100),
              ),
              child: Text('ElevatedButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.red,
                elevation: 10.0,
              ),
              child: Text('OutlinedButton'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('TextButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  // shape: StadiumBorder()
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('OutlinedButton_shape'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  // shape: StadiumBorder()
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              child: Text('OutlinedButton_shape'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('ElevatedButton_icon'),
              icon: Icon(Icons.keyboard_tab),
            ),
          ],
        ),
      ),
    );
  }
}
