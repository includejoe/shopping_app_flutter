import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/main_screen_provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
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
                        onTap: () {
                          mainScreenNotifier.screenIndex = 0;
                        },
                        icon: mainScreenNotifier.screenIndex == 0 ?
                        Icons.home : Icons.home_outlined
                    ),
                    BottomNavItem(
                        onTap: () {
                          mainScreenNotifier.screenIndex = 1;
                        },
                        icon: mainScreenNotifier.screenIndex == 1 ?
                        Icons.search : Icons.search_outlined
                    ),
                    BottomNavItem(
                        onTap: () {
                          mainScreenNotifier.screenIndex = 2;
                        },
                        icon: mainScreenNotifier.screenIndex == 2 ?
                        Icons.favorite : Icons.favorite_outline_rounded
                    ),
                    BottomNavItem(
                        onTap: () {
                          mainScreenNotifier.screenIndex = 3;
                        },
                        icon: mainScreenNotifier.screenIndex == 3 ?
                        Icons.shopping_cart : Icons.shopping_cart_outlined
                    ),
                    BottomNavItem(
                        onTap: () {
                          mainScreenNotifier.screenIndex = 4;
                        },
                        icon: mainScreenNotifier.screenIndex == 4 ?
                        Icons.person : Icons.person_outlined
                    ),
                  ],
                ),
              ),
            )
        );
      }
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({Key? key, this.onTap, this.icon}) : super(key: key);

  final void Function()? onTap;
  final IconData? icon;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child:  SizedBox(
          height: 36,
          width: 36,
          child: Icon(icon, color: Colors.white,),
        )
    );
  }
}
