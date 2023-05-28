import 'package:flutter/services.dart' as bundle;
import 'package:shopping_app/models/sneaker.dart';

// this class fetches data from the json files and return it to the app
class GetSneakers {
  Future<List<Sneaker>> getMaleSneakers() async {
    final data = await bundle.rootBundle.loadString("data/mens_sneakers.json");
    final maleSneakers = sneakersFromJson(data);
    return maleSneakers;
  }

  Future<List<Sneaker>> getFemaleSneakers() async {
    final data = await bundle.rootBundle.loadString("data/womens_sneakers.json");
    final femaleSneakers = sneakersFromJson(data);
    return femaleSneakers;
  }

  Future<Sneaker> getMaleSneakerById(String id) async {
    final data = await bundle.rootBundle.loadString("data/mens_sneakers.json");
    final maleSneakers = sneakersFromJson(data);

    final sneaker = maleSneakers.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }

  Future<Sneaker> getFemaleSneakerById(String id) async {
    final data = await bundle.rootBundle.loadString("data/womens_sneakers.json");
    final femaleSneakers = sneakersFromJson(data);

    final sneaker = femaleSneakers.firstWhere((sneaker) => sneaker.id == id);
    return sneaker;
  }
}