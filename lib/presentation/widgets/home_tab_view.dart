import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/widgets/product_card.dart';
import '../../models/sneaker.dart';
import '../../utils/app_style.dart';
import 'latest_cards.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({
    super.key,
    required Future<List<Sneaker>> sneakers
  }) : _sneakers = sneakers;

  final Future<List<Sneaker>> _sneakers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 300,
            child: FutureBuilder<List<Sneaker>>(
              future: _sneakers,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if(snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final sneakers = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sneakers?.length,
                    itemBuilder: (context, index) {
                      final sneaker = snapshot.data![index];
                      return ProductCard(
                          image: sneaker.imageUrl[0],
                          price: "\$${sneaker.price}",
                          category: sneaker.category,
                          id: sneaker.id,
                          name: sneaker.name
                      );
                    },
                  );
                }
              },
            )
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
            child: FutureBuilder<List<Sneaker>>(
              future: _sneakers,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if(snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final sneakers = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sneakers?.length,
                    itemBuilder: (context, index) {
                      final sneaker = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: LatestCards(imageUrl: sneaker.imageUrl[0]),
                      );
                    },
                  );
                }
              },
            )
        )
      ],
    );
  }
}
