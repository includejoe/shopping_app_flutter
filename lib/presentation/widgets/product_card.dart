import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/presentation/screens/favourites_screen.dart';
import 'package:shopping_app/utils/app_style.dart';
import 'package:shopping_app/utils/constants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.price,
    required this.category,
    required this.id,
    required this.name
  }) : super(key: key);

  final String name;
  final String image;
  final String price;
  final String category;
  final String id;


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool selected = true;
  final _favouritesBox = Hive.box("favourites_box");

  Future<void> _createFavourites(Map<String, dynamic> addFav) async {
    await _favouritesBox.add(addFav);
    getFavourites();
  }

  getFavourites() {
    final favData = _favouritesBox.keys.map((key) {
      final item = _favouritesBox.get(key);

      return {
        "key": key,
        "id": "id",
      };
    }).toList();

    favourite = favData.toList();
    ids = favourite.map((item) => item["id"]).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1)
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image)
                      )
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () async {
                        if(ids.contains(widget.id)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FavouritesScreen()
                            )
                          );
                        } else {
                          _createFavourites({
                            "id": widget.id,
                            "name": widget.name,
                            "category": widget.category,
                            "price": widget.price,
                            "imageUrl": widget.image
                          });
                        }
                      },
                      child: ids.contains(widget.id) ?
                      const Icon(Icons.favorite, color: Colors.red,) :
                      const Icon(Icons.favorite_outline),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHt(36, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style: appStyleWithHt(18, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyle(30, Colors.black, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: appStyle(18, Colors.grey, FontWeight.w500),
                        ),
                        const SizedBox(width: 5,),
                        ChoiceChip(
                          label: const Text(" "),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
