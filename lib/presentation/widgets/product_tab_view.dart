import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_app/models/sneaker.dart';
import 'package:shopping_app/presentation/widgets/stagger_card.dart';

class ProductTabView extends StatelessWidget {
  const ProductTabView({
    super.key,
    required Future<List<Sneaker>> sneakers
  }) : _sneakers = sneakers;

  final Future<List<Sneaker>> _sneakers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneaker>>(
      future: _sneakers,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if(snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final sneakers = snapshot.data;
          return MasonryGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            scrollDirection: Axis.vertical,
            itemCount: sneakers?.length,
            itemBuilder: (context, index) {
              final sneaker = snapshot.data![index];
              return StaggerCard(
                  height: (index % 4 ==1 || index % 4== 3) ? 70 : 100,
                  image: sneaker.imageUrl[0],
                  price: "\$${sneaker.price}",
                  name: sneaker.name
              );
            },
          );
        }
      },
    );
  }
}
