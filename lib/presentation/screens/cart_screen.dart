import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/presentation/widgets/button.dart';
import 'package:shopping_app/utils/app_style.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final _cartBox = Hive.box("cart_box");

  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "name": item["name"],
        "imageUrl": item["imageUrl"],
        "price": item["price"],
        "qty": item["qty"],
        "sizes": item["sizes"],
      };
    }).toList();

    cart = cartData.reversed.toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  Text(
                    "My Cart",
                    style: appStyle(40, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final data = cart[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: doNothing,
                                    flex: 1,
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: "Delete",
                                  )
                                ],
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1)
                                    ),
                                  ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Image.asset(
                                            data["imageUrl"],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12, left: 12),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data["name"],
                                                style: appStyle(16, Colors.black, FontWeight.bold),
                                              ),
                                              const SizedBox(height: 5,),
                                              Text(
                                                data["category"],
                                                style: appStyle(14, Colors.grey, FontWeight.bold),
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Text(
                                                    "\$${data["price"]}",
                                                    style: appStyle(18, Colors.black, FontWeight.bold),
                                                  ),
                                                  const SizedBox(width: 40,),
                                                  data["sizes"].length > 0 ? Row(
                                                    children: [
                                                      Text(
                                                        "Size",
                                                        style: appStyle(18, Colors.black, FontWeight.bold),
                                                      ),
                                                      const SizedBox(width: 15,),
                                                      Text(
                                                        data["sizes"],
                                                        style: appStyle(18, Colors.black, FontWeight.bold),
                                                      ),
                                                    ],
                                                  ) : Container(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16)
                                              )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // cartProvider.increment();
                                                  },
                                                  child: const Icon(
                                                    AntDesign.minussquare,
                                                    size: 20,
                                                    color: Colors.grey
                                                  ),
                                                ),
                                                Text(
                                                  data["qty"].toString(),
                                                  style: appStyle(16, Colors.black, FontWeight.normal),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    // cartProvider.increment();
                                                  },
                                                  child: const Icon(
                                                      AntDesign.plussquare,
                                                      size: 20,
                                                      color: Colors.black
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Button(text: "Proceed to Checkout")
              )
            ],
          ),
        ),
      ),
    );
  }
}
