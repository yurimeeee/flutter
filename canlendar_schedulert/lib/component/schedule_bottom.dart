import 'package:canlendar_schedulert/component/custom_text_filed.dart';
import 'package:canlendar_schedulert/const/colors.dart';
import 'package:canlendar_schedulert/model/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleBottom extends StatefulWidget {
  final DateTime selectedDay;

  const ScheduleBottom({
    super.key,
    required this.selectedDay,
  });

  @override
  State<ScheduleBottom> createState() => _ScheduleBottomState();
}

class _ScheduleBottomState extends State<ScheduleBottom> {
  final GlobalKey<FormState> formKey = GlobalKey();
  // 프로젝트 내에 단 하나의 값만 존재하는 키캆 만듦 > 폼의 상태를 저장

  int? startTime;
  int? endTime;
  String? content;
  String selectedColor = categoryColors.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _Time(
                    onStartSaved: onStartTimeSaved,
                    onEndSaved: onEndTimeSaved,
                    onStartValidate: onStartTimeValidate,
                    onEndValidate: onEndTimeValidate,
                ),
                SizedBox(height: 8.0),
                _Content(
                    onSaved: onContentSaved,
                    onValidate: onContentValidate,
                ),
                SizedBox(height: 8.0),
                _Categories(
                    selectedColor: selectedColor,
                    onTap: (String color) {
                      setState(() {
                        selectedColor = color;
                      });
                    }),
                SizedBox(height: 8.0),
                _SaveButton(onPressed: onSavePressed),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStartTimeSaved(String? val){
    if(val == null){
      return;
    }
    startTime = int.parse(val);
  }
  String? onStartTimeValidate(String? val){
    if(val == null){
      return '값을 입력 해주세요.';
    }
    if(int.tryParse(val) == null){
      return '숫자를 입력 해주세요.';
    }
    final time = int.tryParse(val);
    if(time! > 24 || time < 0){
      return '0과 24 사이의 숫자를 입력 해주세요.';
    }
  }
  void onEndTimeSaved(String? val){
    if(val == null){
      return;
    }
    endTime = int.parse(val);
  }
  String? onEndTimeValidate(String? val){
    if(val == null){
      return '값을 입력 해주세요.';
    }
    if(int.tryParse(val) == null){
      return '숫자를 입력 해주세요.';
    }

    final time = int.tryParse(val);
    if(time! > 24 || time < 0){
      return '0과 24 사이의 숫자를 입력 해주세요.';
    }
  }
  void onContentSaved(String? val){
    if(val == null){
      return;
    }
    content = val;
  }
  String? onContentValidate(String? val){
    if(val == null){
      return '내용을 입력 해주세요.';
    }
    if(val.length < 5){
      return '5자 이상을 입력 해주세요.';
    }
    return null;
  }

  void onSavePressed(){
    final isValid = formKey.currentState!.validate();

    if(isValid) {
      formKey.currentState!.save();

      final schedule = Schedule(
        id: 999,
        startTime: startTime!,
        endTime: endTime!,
        content: content!,
        color: selectedColor,
        date: widget.selectedDay,
        createAt: DateTime.now().toUtc(),
      );

      Navigator.of(context).pop();
    }


  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final FormFieldValidator<String> onStartValidate;
  final FormFieldValidator<String> onEndValidate;

  _Time({
    super.key,
    required this.onStartSaved,
    required this.onEndSaved,
    required this.onStartValidate,
    required this.onEndValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFiled(
                label: '시작 시간',
                onSaved:onStartSaved,
                validator: onStartValidate,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: CustomTextFiled(
                label: '종료 시간',
                onSaved: onEndSaved,
                validator: onEndValidate,
              ),
            ),
          ],
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       formKey.currentState!
        //           .save(); // 실행시 폼 안의 모든 TextFiled에 onsave 함수 실행
        //       // formKey.currentState!
        //       //     .validate(); // 실행시 폼 안의 모든 TextFiled에 validate 함수 실행
        //       // final vali = formKey.currentState!.validate();
        //       // print(vali);
        //     },
        //     child: Text('save'))
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> onValidate;

  const _Content({
    super.key,
    required this.onSaved,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextFiled(
      label: '내용',
      expand: true,
      onSaved: onSaved,
      validator: onValidate,
      ),
    );
  }
}

typedef OnColorSelected = void Function(String color);

class _Categories extends StatelessWidget {
  final String selectedColor;
  final OnColorSelected onTap;

  const _Categories({
    super.key,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColors
          .map((e) => Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    onTap(e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(
                          'FF$e',
                          radix: 16,
                        ),
                      ),
                      shape: BoxShape.circle,
                      border: e == selectedColor
                          ? Border.all(
                              color: Colors.black,
                              width: 4.0,
                            )
                          : null,
                    ),
                    width: 24.0,
                    height: 24.0,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text('저장'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
