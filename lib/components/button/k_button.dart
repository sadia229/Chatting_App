import 'package:chatting_app/styles/k_colors.dart';
import 'package:chatting_app/styles/k_text_style.dart';
import 'package:chatting_app/utils/extension.dart';
import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final VoidCallback? tap;

  const KButton({this.tap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: context.screenWidth * 0.4,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: KColor.blue,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.people_outline,
              color: KColor.white,
            ),
            const SizedBox(width: 5),
            Text(
              'নতুন বন্ধু করুন',
              style: KTextStyle.description.copyWith(
                color: KColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
