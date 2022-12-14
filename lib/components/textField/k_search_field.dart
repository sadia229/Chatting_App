import 'package:chatting_app/styles/k_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
  SearchTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.callbackFunction,
      required this.readOnly})
      : super(key: key);
  final String hintText;
  final bool readOnly;
  TextEditingController controller = TextEditingController();
  final Function(String value)? callbackFunction;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: (val) {
        if (widget.callbackFunction != null) widget.callbackFunction!(val);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          borderSide: BorderSide.none,
        ),
        fillColor: KColor.searchColor.withOpacity(0.8),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
