import 'package:flutter/material.dart';
import 'package:order_app/rsc/color_manager.dart';
import 'package:order_app/rsc/images_manager.dart';
import 'package:order_app/rsc/text_styles_manager.dart';
import 'package:order_app/rsc/value_manager.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String location;
  final double star;
  final double minute;
  final double delivery;
  const FoodCard({
    super.key,
    required this.name,
    required this.location,
    required this.star,
    required this.minute,
    required this.delivery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: SizeApp.s14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r10),
              ),
              child: Image.asset(
                ImagesApp.bannerImages1,
                fit: BoxFit.fill,
              )),
          Text(
            name,
            style: const TextStyle(
                fontSize: SizeApp.s20, fontWeight: FontWeight.w300),
          ),
          Text(
            location,
            style: TextStyle(
                fontSize: SizeApp.s16,
                fontWeight: FontWeight.w300,
                color: ColorsApp.subTitle),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
                    color: ColorsApp.redOrigin),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text('$star'),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$minute min',
                style: const TextStyle(
                    fontSize: FontSizeApp.s14,
                    fontWeight: FontWeightApp.regular),
              ),
              const SizedBox(width: SizeApp.s10),
              Icon(
                Icons.lens,
                size: SizeApp.s5,
                color: ColorsApp.subTitle,
              ),
              const SizedBox(width: SizeApp.s10),
              Text(
                delivery == 0 ? 'free delivery' : '$delivery',
                style: const TextStyle(
                    fontSize: FontSizeApp.s14,
                    fontWeight: FontWeightApp.regular),
              )
            ],
          )
        ],
      ),
    );
  }
}
