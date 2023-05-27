import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/presentation/widgets/product_card.dart';
import 'package:shopping_app/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
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
                          Tab(text: "Kid's Shoes",),
                        ]
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.265),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 280,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return const ProductCard(
                                    image: "assets/images/sneaker2.png",
                                    price: "\$99.99",
                                    category: "Men's Shoes",
                                    id: "1",
                                    name: "HD Nike"
                                );
                              },
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Latest Shoes",
                                      style: appStyle(24, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Show All",
                                          style: appStyle(22, Colors.black, FontWeight.normal),
                                        ),
                                        const Icon(Icons.arrow_right, size: 30,)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 1,
                                            blurRadius: 0.8,
                                            offset: Offset(0, 1)
                                          )
                                        ]
                                      ),
                                      height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width * 0.28,
                                      child: const Image(
                                        image: AssetImage("assets/images/sneaker1.png"),
                                        fit: BoxFit.contain,
                                      )
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.405,
                            color: Colors.green,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.405,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
