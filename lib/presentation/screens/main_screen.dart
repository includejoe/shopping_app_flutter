import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/screens/cart_screen.dart';
import 'package:shopping_app/presentation/screens/home_screen.dart';
import 'package:shopping_app/presentation/screens/profile_screen.dart';
import 'package:shopping_app/presentation/screens/search_screen.dart';
import 'package:shopping_app/presentation/widgets/bottom_nav.dart';
import 'package:shopping_app/providers/main_screen_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  final List<Widget> screenList = const [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child){
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: screenList[mainScreenNotifier.screenIndex],
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
