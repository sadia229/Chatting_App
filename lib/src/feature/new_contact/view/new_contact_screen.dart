import 'package:chatting_app/components/alertDialog/k_confirm_dialog.dart';
import 'package:chatting_app/components/alertDialog/k_dialog.dart';
import 'package:chatting_app/components/appBar/k_appbar.dart';
import 'package:chatting_app/components/button/k_button.dart';
import 'package:chatting_app/database/user_db.dart';
import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:chatting_app/styles/k_colors.dart';
import 'package:chatting_app/styles/k_text_style.dart';
import 'package:chatting_app/utils/extension.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  final UserInfo? userInfo;

  const AddContactScreen({Key? key, this.userInfo}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  late List<UserInfo> userInfo;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KAppBar(title: 'বন্ধুদল '),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : userInfo.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('কোনো তথ্য নেই '),
                      const SizedBox(height: 20),
                      KButton(
                        tap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const KDialog();
                            },
                          );
                        },
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'বন্ধু তালিকা',
                            style: KTextStyle.headline8.copyWith(
                              color: KColor.black.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: userInfo.length,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: KColor.chipColor,
                                      child: Text(
                                        userInfo[index]
                                            .name![0]
                                            .toString()
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: KColor.white),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(userInfo[index]
                                              .name
                                              .toString()),
                                          const SizedBox(height: 5),
                                          Text(
                                            userInfo[index]
                                                .phoneNumber
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.screenWidth * 0.4,
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return KConfirmDialog(
                                              onDelete: () async {
                                                await UserDatabase.instance
                                                    .delete(userInfo[index]
                                                        .id!
                                                        .toInt());
                                                Navigator.pushNamed(
                                                    context, '/mainScreen');
                                              },
                                              onCancel: () {
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_outlined,
                                        color: KColor.selectColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          KButton(
                            tap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return KDialog();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
