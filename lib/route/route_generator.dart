import 'package:chatting_app/src/feature/chatting/view/chatting_screen.dart';
import 'package:chatting_app/src/feature/new_contact/view/new_contact_screen.dart';
import 'package:chatting_app/src/feature/onboarding/view/onboarding_screen.dart';
import 'package:chatting_app/src/feature/profile/view/profile_screen.dart';
import 'package:chatting_app/src/main_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/onboarding':
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case '/chatting':
        return MaterialPageRoute(
          builder: (_) => const ChattingScreen(),
        );
      case '/add_new_contact':
        return MaterialPageRoute(
          builder: (_) => const AddContactScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case '/mainScreen':
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
    }
  }
}
