import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/screens/cart_screen.dart';
import 'package:shopping_app/presentation/screens/home_screen.dart';
import 'package:shopping_app/presentation/screens/profile_screen.dart';
import 'package:shopping_app/presentation/screens/search_screen.dart';
import 'package:shopping_app/presentation/widgets/bottom_nav_item.dart';
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
          bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomNavItem(
                          onTap: (){ mainScreenNotifier.screenIndex = 0; },
                          icon: mainScreenNotifier.screenIndex == 0 ?
                                Icons.home : Icons.home_outlined
                      ),
                      BottomNavItem(
                          onTap: (){ mainScreenNotifier.screenIndex = 1; },
                          icon: mainScreenNotifier.screenIndex == 1 ?
                          Icons.search : Icons.search_outlined
                      ),
                      BottomNavItem(
                          onTap: (){ mainScreenNotifier.screenIndex = 2; },
                          icon: mainScreenNotifier.screenIndex == 2 ?
                          Icons.add_circle_outlined : Icons.add_circle_outline
                      ),
                      BottomNavItem(
                          onTap: (){ mainScreenNotifier.screenIndex = 3; },
                          icon: mainScreenNotifier.screenIndex == 3 ?
                          Icons.shopping_cart : Icons.shopping_cart_outlined
                      ),
                      BottomNavItem(
                          onTap: (){ mainScreenNotifier.screenIndex = 4; },
                          icon: mainScreenNotifier.screenIndex == 4 ?
                          Icons.person : Icons.person_outlined
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
