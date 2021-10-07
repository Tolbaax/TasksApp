import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String? labelText;
  int? lines;
  var onTap;
  CustomTextFormField({this.labelText,this.lines,this.onTap});
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: TextFormField(
        maxLines: widget.lines,
        onTap: widget.onTap,
        decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            )
        ),
      ),
    );
  }
}
