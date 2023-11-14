import 'package:flutter/material.dart';
import 'package:order_app/presentation/home_page/food_detail_screen.dart';
import 'package:order_app/rsc/color_manager.dart';
import 'package:order_app/rsc/text_styles_manager.dart';
import 'package:order_app/rsc/value_manager.dart';

class DetailFoodCard extends StatelessWidget {
  const DetailFoodCard({
    super.key,
    required this.image,
    required this.name,
    required this.country,
    required this.minute,
    required this.delivery,
    required this.star,
  });
  final String image;
  final String name;
  final String country;
  final double minute;
  final double delivery;
  final double star;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FoodDetailScreen())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BorderRadiusApp.r10),
            ),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Positioned(
                    left: SizeApp.s14,
                    bottom: SizeApp.s14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: SizeApp.s16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$minute min',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeApp.s12,
                                  fontWeight: FontWeightApp.medium),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              height: SizeApp.s16,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.black.withOpacity(0.5),
                                size: SizeApp.s14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              delivery == 0 ? 'free' : '$delivery',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeApp.s12,
                                  fontWeight: FontWeightApp.medium),
                            )
                          ],
                        ),
                      ],
                    )),
                Positioned(
                  bottom: SizeApp.s16,
                  right: SizeApp.s16,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(BorderRadiusApp.r6),
                        color: ColorsApp.redOrigin),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text('$star'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            name,
            style: TextStyle(
                color: ColorsApp.textColor,
                fontSize: SizeApp.s20,
                fontWeight: FontWeightApp.regular),
          ),
          Text(
            country,
            style: TextStyle(
                color: ColorsApp.subTitle,
                fontSize: SizeApp.s16,
                fontWeight: FontWeightApp.regular),
          )
        ],
      ),
    );
  }
}
