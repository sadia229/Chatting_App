import 'package:chatting_app/components/button/confirm_btn.dart';
import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:chatting_app/styles/k_colors.dart';
import 'package:chatting_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class KConfirmDialog extends StatefulWidget {
  final UserInfo? userInfo;
  final VoidCallback? onDelete;
  final VoidCallback? onCancel;

  const KConfirmDialog({Key? key, this.userInfo, this.onDelete, this.onCancel})
      : super(key: key);

  @override
  State<KConfirmDialog> createState() => _KConfirmDialogState();
}

class _KConfirmDialogState extends State<KConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: KColor.white,
      insetPadding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SizedBox(
        height: 320,
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'আপনি নিশ্চিত ?',
                style: KTextStyle.dialog.copyWith(
                  color: KColor.blackbg.withOpacity(0.6),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KConfirmButton(
                    title: 'নিশ্চিত',
                    tap: widget.onDelete,
                  ),
                  KConfirmButton(
                    title: 'বাদ দিন',
                    tap: widget.onCancel,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
