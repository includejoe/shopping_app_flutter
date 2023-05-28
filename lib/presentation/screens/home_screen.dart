import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/api/get_sneakers.dart';
import 'package:shopping_app/presentation/widgets/home_tab_view.dart';
import 'package:shopping_app/utils/app_style.dart';
import '../../models/sneaker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);
  late Future<List<Sneaker>> _maleSneakers;
  late Future<List<Sneaker>> _femaleSneakers;

  void getMaleSneakers() {
    _maleSneakers = GetSneakers().getMaleSneakers();
  }

  void getFemaleSneakers() {
    _femaleSneakers = GetSneakers().getFemaleSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMaleSneakers();
    getFemaleSneakers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, top: 16),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/top_bg.png"),
                    fit: BoxFit.fill
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kick Junction",
                        style: appStyleWithHt(42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appStyleWithHt(42, Colors.white, FontWeight.bold, 1.5),
                      ),
                      TabBar(
                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.only(right: 40),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(text: "Men's Shoes",),
                          Tab(text: "Women's Shoes",),
                        ]
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.230),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      HomeTabView(sneakers: _maleSneakers),
                      HomeTabView(sneakers: _femaleSneakers),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
