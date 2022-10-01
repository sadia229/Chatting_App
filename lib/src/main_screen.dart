import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:chatting_app/src/feature/chatting/view/chatting_screen.dart';
import 'package:chatting_app/src/feature/new_contact/view/new_contact_screen.dart';
import 'package:chatting_app/src/feature/profile/view/profile_screen.dart';
import 'package:chatting_app/styles/k_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const [
            AddContactScreen(),
            ChattingScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        iconSize: 30,
        containerHeight: 65,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(microseconds: 10),
            curve: Curves.linear,
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('বন্ধু সংখ্যা'),
            activeColor: KColor.chipColor,
            inactiveColor: KColor.chipColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.chat_bubble_outline_outlined),
            title: const Text('চিঠিপত্র'),
            activeColor: KColor.chipColor,
            inactiveColor: KColor.chipColor.withOpacity(0.7),
            textAlign: TextAlign.center,
          ),

          BottomNavyBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            title: const Text('প্রোফাইল'),
            activeColor: KColor.chipColor,
            inactiveColor: KColor.chipColor.withOpacity(0.7),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
