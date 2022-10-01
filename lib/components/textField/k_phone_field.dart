import 'package:chatting_app/styles/k_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KPhoneField extends StatefulWidget {
  KPhoneField(
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
  State<KPhoneField> createState() => _KPhoneFieldState();
}

class _KPhoneFieldState extends State<KPhoneField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please FillUp';
        }
        return null;
      },
      keyboardType: TextInputType.phone,
      readOnly: widget.readOnly,
      controller: widget.controller,
      onChanged: (val) {
        if (widget.callbackFunction != null) widget.callbackFunction!(val);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),

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
