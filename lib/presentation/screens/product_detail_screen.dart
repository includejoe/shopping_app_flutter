import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/api/get_sneakers.dart';
import 'package:shopping_app/models/sneaker.dart';
import 'package:shopping_app/presentation/widgets/button.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/utils/app_style.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.category
  }) : super(key: key);

  final String id;
  final String category;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController pageController = PageController();
  late Future<Sneaker> _sneaker;
  final _cartBox = Hive.box("cart_box");

  void getSneaker() {
    if(widget.category == "Men's Sneakers") {
      _sneaker = GetSneakers().getMaleSneakerById(widget.id);
    } else if (widget.category == "Women's Sneakers") {
      _sneaker = GetSneakers().getFemaleSneakerById(widget.id);
    }
  }

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  void initState() {
    super.initState();
    getSneaker();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFE2E2E2),
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      extendBody: true,
      body: FutureBuilder<Sneaker>(
          future: _sneaker,
          builder: (context, snapshot) {
            return Consumer<ProductNotifier>(
                builder: (context, productNotifier, child) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    final sneaker = snapshot.data;
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          leadingWidth: 0,
                          pinned: true,
                          snap: false,
                          floating: true,
                          backgroundColor: Colors.transparent,
                          expandedHeight: MediaQuery.of(context).size.height,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                      statusBarColor: Colors.black, // Set your desired color here
                                    ));
                                    productNotifier.sneakerSizes.clear();
                                  },
                                  child: const Icon(Icons.close, color: Colors.black,),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.more_horiz, color: Colors.black,),
                                ),
                              ],
                            ),
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sneaker!.imageUrl.length,
                                    controller: pageController,
                                    onPageChanged: (page) {
                                      productNotifier.activeScreen = page;
                                    },
                                    itemBuilder: (context, int index) {
                                      return Stack(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height * 0.39,
                                              width: MediaQuery.of(context).size.width,
                                              color: Colors.grey.shade300,
                                              child: Image.asset(
                                                sneaker.imageUrl[index],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Positioned(
                                                top: MediaQuery.of(context).size.height * 0.12,
                                                right: 15,
                                                height: 0.1,
                                                child: const Icon(
                                                    Icons.favorite_outline,
                                                    color: Colors.grey
                                                )
                                            ),
                                            Positioned(
                                                bottom: 28,
                                                right: 0,
                                                left: 0,
                                                height: MediaQuery.of(context).size.height * 0.3,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: List<Widget>.generate(
                                                      sneaker.imageUrl.length, (index) =>
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 4),
                                                        child: CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor: productNotifier.activeScreen != index ?
                                                          Colors.grey : Colors.black,
                                                        ),
                                                      )
                                                  ),
                                                )),
                                          ]);
                                    },
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                sneaker.name,
                                                style: appStyle(40, Colors.black, FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    sneaker.category,
                                                    style: appStyle(20, Colors.grey, FontWeight.w500),
                                                  ),
                                                  const SizedBox(width: 20,),
                                                  RatingBar.builder(
                                                    initialRating: 4,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 22,
                                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                                                    itemBuilder: (context, _) => const Icon(
                                                        Icons.star,
                                                        size: 18,
                                                        color: Colors.black
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "\$${sneaker.price}",
                                                    style: appStyle(26, Colors.black, FontWeight.w600),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Colors",
                                                        style: appStyle(18, Colors.black, FontWeight.w500),
                                                      ),
                                                      const SizedBox(width: 5,),
                                                      const CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor: Colors.black,
                                                      ),
                                                      const SizedBox(width: 5,),
                                                      const CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor: Colors.red,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Select Sizes",
                                                        style: appStyle(20, Colors.black, FontWeight.w600),
                                                      ),
                                                      const SizedBox(width: 20,),
                                                      Text(
                                                        "View size guide",
                                                        style: appStyle(20, Colors.grey, FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10,),
                                                  SizedBox(
                                                    height: 40,
                                                    child: ListView.builder(
                                                        itemCount: productNotifier.sneakerSizes.length,
                                                        scrollDirection: Axis.horizontal,
                                                        padding: EdgeInsets.zero,
                                                        itemBuilder: (context, index) {
                                                          final sizes = productNotifier.sneakerSizes[index];

                                                          return Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                            child: ChoiceChip(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(20),
                                                                  side: const BorderSide(
                                                                      color: Colors.black,
                                                                      width: 1,
                                                                      style: BorderStyle.solid
                                                                  )
                                                              ),
                                                              disabledColor: Colors.white,
                                                              label: Text(
                                                                sizes["size"],
                                                                style: appStyle(
                                                                    18,
                                                                    sizes["isSelected"] ? Colors.white : Colors.black,
                                                                    FontWeight.w500
                                                                ),
                                                              ),
                                                              selectedColor: Colors.black,
                                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                                              selected: sizes["isSelected"],
                                                              onSelected: (newState) {
                                                                if(productNotifier.sizes.contains(sizes["size"])) {
                                                                  productNotifier.sizes.remove(sizes["size"]);
                                                                } else {
                                                                  productNotifier.sizes.add(sizes["size"]);
                                                                }
                                                                productNotifier.toggleSize(index);
                                                              },
                                                            ),
                                                          );}
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              const Divider(
                                                thickness: 0.5,
                                                indent: 10,
                                                endIndent: 10,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(height: 10,),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                child: Text(
                                                  sneaker.title,
                                                  style: appStyle(26, Colors.black, FontWeight.w700),
                                                ),
                                              ),
                                              const SizedBox(height: 10,),
                                              Text(
                                                sneaker.description,
                                                textAlign: TextAlign.justify,
                                                maxLines: 4,
                                                style: appStyle(14, Colors.black, FontWeight.normal),
                                              ),
                                              const SizedBox(height: 10,),
                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Padding(
                                                    padding: const EdgeInsets.only(top: 12),
                                                    child: Button(
                                                      onTap: () async {
                                                        _createCart({
                                                          "id": sneaker.id,
                                                          "name": sneaker.name,
                                                          "sizes": productNotifier.sizes,
                                                          "category": sneaker.category,
                                                          "imageUrl": sneaker.imageUrl[0],
                                                          "price": sneaker.price,
                                                          "qty": 1
                                                        });
                                                        productNotifier.sizes.clear();
                                                        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                                                          statusBarColor: Colors.black,
                                                        ));
                                                        Navigator.pop(context);
                                                      },
                                                      text: "Add to Cart",
                                                    )
                                                ),
                                              ),
                                              const SizedBox(height: 50,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                });
          }
      )
    );
  }
}
