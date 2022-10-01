import 'package:chatting_app/components/appBar/k_appbar.dart';
import 'package:chatting_app/components/textField/k_search_field.dart';
import 'package:chatting_app/database/user_db.dart';
import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:chatting_app/styles/k_colors.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatefulWidget {
  final UserInfo? userInfo;
  const ChattingScreen({Key? key, this.userInfo}) : super(key: key);

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  TextEditingController search = TextEditingController();
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
          child: KAppBar(title: 'আমার পত্র'),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : userInfo.isEmpty
            ? const Text('কোনো তথ্য নেই ')
            : SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              children: [
                SearchTextField(
                  controller: search,
                  readOnly: false,
                  hintText: 'খুঁজুন',
                  callbackFunction: (e) {},
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userInfo.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                          Column(
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
                        ],
                      ),
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
