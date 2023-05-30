import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/screens/cart_screen.dart';
import 'package:shopping_app/presentation/screens/home_screen.dart';
import 'package:shopping_app/presentation/screens/profile_screen.dart';
import 'package:shopping_app/presentation/screens/search_screen.dart';
import 'package:shopping_app/presentation/widgets/bottom_nav.dart';
import 'package:shopping_app/providers/main_screen_provider.dart';
import 'package:shopping_app/providers/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
        ChangeNotifierProvider(create: (context) => ProductNotifier())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final List<Widget> screenList = const [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
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

