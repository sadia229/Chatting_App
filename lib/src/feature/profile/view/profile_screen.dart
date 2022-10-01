import 'package:chatting_app/components/appBar/k_appbar.dart';
import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:chatting_app/styles/b_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserInfo? userIData;
  const ProfileScreen({Key? key, this.userIData}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: KAppBar(title: 'তথ্য যোগ করুন '),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: KColor.chipColor.withOpacity(0.7),
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: KColor.white,
                ),
              ),
              _buildProfileInfo('নাম', ''),
              _buildProfileInfo('ইমেইল', ''),
              _buildProfileInfo('ফোন নম্বর', ''),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _buildProfileInfo(section, info) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              section,
              style: KTextStyle.headline5.copyWith(
                color: KColor.black.withOpacity(0.5),
              ),
            ),
            Flexible(
              child: Text(info),
            ),
          ],
        ),
      ),
    );
  }
}
