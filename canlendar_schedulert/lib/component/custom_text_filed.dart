import 'package:canlendar_schedulert/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String label;
  final bool expand;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextFiled({
    super.key,
    required this.label,
    this.expand = false,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label , style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),),
        if(!expand)renderTextFormFiled(),
        if(expand)
          Expanded(child: renderTextFormFiled(),),
      ],
    );
  }
  renderTextFormFiled(){
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey[100],
        filled: true,  // filled: true, 여야 배경색 지정 가능
      ),
      // 저장 시
      onSaved: onSaved,
      // 검증 로직
      validator: validator,
      maxLines: expand ? null: 1,
      minLines: expand ? null: 1,
      expands: expand,
      cursorColor: Colors.grey,
    );
  }
}
