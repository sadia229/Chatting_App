import 'package:chatting_app/styles/k_colors.dart';
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget {
  final String? title;
  const KAppBar({this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KColor.chipColor,
      elevation: 0,
      title: Text('$title'),
      centerTitle: true,
    );
  }
}
