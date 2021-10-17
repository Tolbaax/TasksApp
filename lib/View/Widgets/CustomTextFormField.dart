import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String? labelText;
  int? lines;
  var onTap;
  var validator;
  var onSaved;
  TextEditingController? controller;
  bool? readOnly;
  CustomTextFormField({this.labelText,this.validator, this.lines, this.onTap, this.readOnly,this.onSaved,this.controller});
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
        maxLines: widget.lines,
        onTap: widget.onTap,
        readOnly: widget.readOnly == null ? false : widget.readOnly!,
        decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
