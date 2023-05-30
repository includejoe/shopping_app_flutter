import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/widgets/category_btn.dart';
import 'package:shopping_app/utils/app_style.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double priceValue = 100;
    List<String> brand = [
      "assets/images/nike.png",
      "assets/images/adidas.png",
      "assets/images/puma.png",
      "assets/images/under_armor.png",
    ];

    return Container(
        height: MediaQuery.of(context).size.height * 0.84,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
            )
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black38
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Filter", style: appStyle(40, Colors.black, FontWeight.bold),),
                  const SizedBox(height: 20),
                  Text("Gender", style: appStyle(20, Colors.black, FontWeight.bold),),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryButton(
                        label: "Men",
                        btnColor: Colors.black,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      CategoryButton(
                        label: "Women",
                        btnColor: Colors.grey,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Category", style: appStyle(20, Colors.black, FontWeight.bold),),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryButton(
                        label: "Sneakers",
                        btnColor: Colors.black,
                        width: 90,
                      ),
                      CategoryButton(
                        label: "Slippers",
                        btnColor: Colors.black,
                        width: 90,
                      ),
                      CategoryButton(
                        label: "Boots",
                        btnColor: Colors.black,
                        width: 90,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Price", style: appStyle(20, Colors.black, FontWeight.bold),),
                  const SizedBox(height: 20),
                  Slider(
                      value: priceValue,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: priceValue.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (double value) {

                      }
                  ),
                  const SizedBox(height: 20),
                  Text("Brand", style: appStyle(20, Colors.black, FontWeight.bold),),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: brand.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12)
                                ),
                              ),
                              child: Image.asset(
                                brand[index],
                                height: 60,
                                width: 80,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
