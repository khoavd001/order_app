import 'package:flutter/material.dart';
import 'package:order_app/presentation/home_page/list_food_detail_page.dart';
import 'package:order_app/presentation/widget/card/food_card.dart';
import 'package:order_app/rsc/color_manager.dart';
import 'package:order_app/rsc/images_manager.dart';
import 'package:order_app/rsc/string_manager.dart';
import 'package:order_app/rsc/text_styles_manager.dart';
import 'package:order_app/rsc/value_manager.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class FeaturePartnerFoodClass {
  final String image;
  final double star;
  final double minute;
  final String name;
  final String locate;
  final double delivery;

  FeaturePartnerFoodClass(
    this.image,
    this.star,
    this.minute,
    this.name,
    this.locate,
    this.delivery,
  );
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    super.key,
  });
  static final _images = [
    ImagesApp.bannerImages1,
    ImagesApp.bannerImages2,
    ImagesApp.bannerImages3,
    ImagesApp.bannerImages4,
  ];
  static final listFeaturePartner = [
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages1, 4.5, 20, 'com tam', 'viet nam', 0),
    FeaturePartnerFoodClass(
        ImagesApp.bannerImages2, 4.5, 20, 'cha lua', 'viet nam', 0)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _renderAppBar(),
        body: _renderBody(context),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          const Divider(
            height: 1,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _renderBanner(),
                const SizedBox(height: 24),
                _renderTitle(StringsApp.featuredPartner, context),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: listFeaturePartner
                        .map((e) => FoodCard(
                            name: e.name,
                            location: e.locate,
                            star: e.star,
                            minute: e.minute,
                            delivery: e.delivery))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 20),
                _renderBannerCard(),
                const SizedBox(height: 24),
                _renderTitle(StringsApp.bestPickRestaurant, context),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: listFeaturePartner
                        .map((e) => FoodCard(
                            name: e.name,
                            location: e.locate,
                            star: e.star,
                            minute: e.minute,
                            delivery: e.delivery))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Stack _renderBannerCard() {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        child: Image.asset(
          ImagesApp.bigBanner,
          fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              StringsApp.freeDeliveryForOneMonth,
              style: const TextStyle(
                  fontWeight: FontWeightApp.bold, fontSize: FontSizeApp.s28),
            ),
            const SizedBox(height: 16),
            Text(
              StringsApp.youveOrderAtleast,
              style: const TextStyle(
                  fontWeight: FontWeightApp.regular, fontSize: FontSizeApp.s16),
            ),
          ],
        ),
      )
    ]);
  }

  Widget _renderTitle(String? title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            title ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: FontSizeApp.s24),
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListFoodDetailPage())),
          child: Text(
            StringsApp.seeAll,
            style: TextStyle(
                color: ColorsApp.redOrigin, fontWeight: FontWeightApp.regular),
          ),
        )
      ],
    );
  }

  Widget _renderBanner() {
    return SizedBox(
      height: 185,
      width: double.infinity,
      child: ScrollPageView(
        indicatorPadding: const EdgeInsets.only(bottom: 8, right: 16),
        indicatorRadius: 5,
        indicatorColor: Colors.grey,
        checkedIndicatorColor: Colors.white,
        controller: ScrollPageController(),
        delay: const Duration(seconds: 3),
        indicatorAlign: Alignment.bottomRight,
        children: (_images.reversed).map((image) => _imageView(image)).toList(),
      ),
    );
  }

  AppBar _renderAppBar() {
    return AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            'Delivery to',
            style: TextStyle(
                color: ColorsApp.redOrigin, fontWeight: FontWeight.w200),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HoChiMinh',
                style: TextStyle(
                  color: ColorsApp.textColor,
                  fontWeight: FontWeight.w200,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget _imageView(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(image, fit: BoxFit.cover),
    ),
  );
}
