import 'package:flutter/material.dart';

import '../../styles/k_colors.dart';
import '../../styles/k_text_style.dart';

class KConfirmButton extends StatelessWidget {
  final String? title;
  final VoidCallback? tap;

  const KConfirmButton({Key? key, this.title, this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 50,
        decoration: BoxDecoration(
          color: KColor.blue,

          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            '$title',
            style: KTextStyle.description.copyWith(
              color: KColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
