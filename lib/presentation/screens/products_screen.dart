import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_app/api/get_sneakers.dart';
import 'package:shopping_app/models/sneaker.dart';
import 'package:shopping_app/presentation/widgets/category_btn.dart';
import 'package:shopping_app/presentation/widgets/filter_bottom_sheet.dart';
import 'package:shopping_app/presentation/widgets/product_tab_view.dart';
import 'package:shopping_app/presentation/widgets/stagger_card.dart';
import 'package:shopping_app/utils/app_style.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, required this.tabIndex}) : super(key: key);

  final int tabIndex;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with TickerProviderStateMixin {
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close, color: Colors.white,),
                            ),
                            GestureDetector(
                              onTap: () {
                                filter();
                              },
                              child: const Icon(Icons.filter_list, color: Colors.white,),
                            ),
                          ],
                        ),
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
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 16,
                    right: 16
                ),
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      ProductTabView(sneakers: _maleSneakers),
                      ProductTabView(sneakers: _femaleSneakers)
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> filter() {

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => const FilterBottomSheet()
    );
  }
}