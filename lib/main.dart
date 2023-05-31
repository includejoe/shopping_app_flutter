import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/screens/cart_screen.dart';
import 'package:shopping_app/presentation/screens/favourites_screen.dart';
import 'package:shopping_app/presentation/screens/home_screen.dart';
import 'package:shopping_app/presentation/screens/profile_screen.dart';
import 'package:shopping_app/presentation/screens/search_screen.dart';
import 'package:shopping_app/presentation/widgets/bottom_nav.dart';
import 'package:shopping_app/providers/main_screen_provider.dart';
import 'package:shopping_app/providers/product_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("cart_box");
  await Hive.openBox("favourites_box");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
        ChangeNotifierProvider(create: (context) => ProductNotifier())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Widget> screenList = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouritesScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home:  Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child){
          return Scaffold(
            backgroundColor: const Color(0xFFE2E2E2),
            body: screenList[mainScreenNotifier.screenIndex],
            bottomNavigationBar: const BottomNavigation(),
          );
        },
      )
    );
  }
}

