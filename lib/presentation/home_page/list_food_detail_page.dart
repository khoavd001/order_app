import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:order_app/presentation/home_page/food_detail_screen.dart';
import 'package:order_app/presentation/widget/card/detail_food_card.dart';
import 'package:order_app/rsc/color_manager.dart';
import 'package:order_app/rsc/images_manager.dart';
import 'package:order_app/rsc/string_manager.dart';
import 'package:order_app/rsc/text_styles_manager.dart';
import 'package:order_app/rsc/value_manager.dart';

class FeaturePartnerFoodClass {
  final String image;
  final double star;
  final double minute;
  final String name;
  final String country;
  final double delivery;

  FeaturePartnerFoodClass(
    this.image,
    this.star,
    this.minute,
    this.name,
    this.country,
    this.delivery,
  );
}

class ListFoodDetailPage extends StatelessWidget {
  const ListFoodDetailPage({super.key});
  static final listFeaturePartner = [
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages1, 4.5, 20, 'com tam', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages2, 4.5, 20, 'cha lua', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages3, 4.5, 20, 'com tam', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages4, 4.5, 20, 'cha lua', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages1, 4.5, 20, 'com tam', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages2, 4.5, 20, 'cha lua', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages3, 4.5, 20, 'com tam', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages4, 4.5, 20, 'cha lua', 'viet nam', 0),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Text(
            StringsApp.featuredPartner,
            style: const TextStyle(
                color: Colors.black,
                fontSize: SizeApp.s16,
                fontWeight: FontWeightApp.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 100,
              crossAxisCount: 2,
              children: listFeaturePartner
                  .map((e) => DetailFoodCard(
                      image: e.image,
                      name: e.name,
                      country: e.country,
                      minute: e.minute,
                      delivery: e.delivery,
                      star: e.star))
                  .toList()),
        ),
      ),
    );
  }
}
