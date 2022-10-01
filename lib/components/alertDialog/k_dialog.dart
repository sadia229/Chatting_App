import 'package:chatting_app/components/textField/k_phone_field.dart';
import 'package:chatting_app/components/textField/k_text_field.dart';
import 'package:chatting_app/database/user_db.dart';
import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:chatting_app/styles/k_colors.dart';
import 'package:chatting_app/styles/k_text_style.dart';
import 'package:flutter/material.dart';

class KDialog extends StatefulWidget {
  final UserInfo? userInfo;
  const KDialog({Key? key, this.userInfo}) : super(key: key);

  @override
  State<KDialog> createState() => _KDialogState();
}

class _KDialogState extends State<KDialog> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late List<UserInfo> userInfo;
  bool isLoading = false;
  late int id;
  late String name;
  late String email;
  late String phone;
  late String bd;

  @override
  void initState() {
    super.initState();
    id = widget.userInfo?.id ?? 0;
    name = widget.userInfo?.name ?? '';
    email = widget.userInfo?.name ?? '';
    phone = widget.userInfo?.email ?? '';
    bd = widget.userInfo?.bd ?? '';
    refreshUser();
  }

  @override
  void dispose() {
    UserDatabase.instance.close();
    super.dispose();
  }

  Future refreshUser() async {
    setState(() {
      isLoading = true;
    });
    userInfo = await UserDatabase.instance.readAllUser();
    setState(() {
      isLoading = false;
    });
  }

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
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'নতুন বন্ধুর তথ্য ',
                    style: KTextStyle.dialog.copyWith(
                      color: KColor.blackbg.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 25),
                  KTextField(
                    controller: nameController,
                    hintText: 'নাম লিখুন',
                    callbackFunction: (name) {
                      setState(() {
                        this.name = name;
                      });
                    },
                    readOnly: false,
                  ),
                  const SizedBox(height: 15),
                  KPhoneField(
                    controller: phoneController,
                    hintText: 'ফোন নাম্বার  লিখুন ',
                    callbackFunction: (phone) {
                      setState(() {
                        this.phone = phone;
                      });
                    },
                    readOnly: false,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  InkWell(
                    onTap: ()async{
                      final note = UserInfo(
                          name: name,
                          email: email,
                          phoneNumber: phone,
                          bd: bd,
                          createDate: DateTime.now()
                      );
                      await UserDatabase.instance.create(note);
                      Navigator.pushNamed(context, '/mainScreen');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 44,
                      decoration: BoxDecoration(
                        color: KColor.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'যোগ করুন ',
                          style: KTextStyle.description.copyWith(
                            color: KColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
