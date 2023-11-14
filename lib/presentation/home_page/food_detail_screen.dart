import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:order_app/rsc/color_manager.dart';
import 'package:order_app/rsc/images_manager.dart';
import 'package:order_app/rsc/text_styles_manager.dart';
import 'package:order_app/rsc/value_manager.dart';

class Toping {
  final String name;

  Toping(this.name);
}

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

String _verticalGroupValue = listTopping[0].name;
final _status = ["Chocolate", "Cookies and Cream", "Funfetti"];
final listTopping = [
  Toping('Chocolate'),
  Toping('Cookies and Cream'),
  Toping('Funfetti'),
  Toping('M and M'),
  Toping('Red Velvet'),
  Toping('Peanut Butter'),
  Toping('Snickerdoodle'),
];

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [_renderAppBar(context), _renderBody()])),
    );
  }

  Padding _renderBody() {
    return Padding(
      padding: const EdgeInsets.all(PaddingApp.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cookie Sandwich',
            style: const TextStyle(
                fontSize: SizeApp.s24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: SizeApp.s14),
          Text(
            'Shortbread, chocolate turtle cookies, and red velvet. 8 ounces cream cheese, softened.',
            style: TextStyle(color: ColorsApp.subTitle),
          ),
          const SizedBox(height: SizeApp.s14),
          Row(
            children: [
              Text(
                '\$\$',
                style: TextStyle(color: ColorsApp.subTitle),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.lens,
                size: SizeApp.s5,
                color: ColorsApp.subTitle,
              ),
              const SizedBox(width: 16),
              Text(
                'country',
                style: TextStyle(color: ColorsApp.subTitle),
              )
            ],
          ),
          const SizedBox(height: SizeApp.s14),
          _renderTitle('Choice of top Cookie'),
          const SizedBox(height: SizeApp.s14),
          Column(
            children: <Widget>[
              RadioGroup<String>.builder(
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  debugPrint('value: $value');
                  _verticalGroupValue = value ?? '';
                  debugPrint('value: $value');
                }),
                items: listTopping.map((e) => e.name).toList(),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                fillColor: ColorsApp.redOrigin,
              ),
            ],
          ),
          const SizedBox(height: SizeApp.s14),
          _renderTitle('Choice of Bottom Cookie'),
          Column(
            children: <Widget>[
              RadioGroup<String>.builder(
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  debugPrint('value: $value');
                  _verticalGroupValue = value ?? '';
                  debugPrint('value: $value');
                }),
                items: listTopping.map((e) => e.name).toList(),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                fillColor: ColorsApp.redOrigin,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _renderTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                color: ColorsApp.textColor,
                fontSize: SizeApp.s20,
                fontWeight: FontWeightApp.regular)),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: SizeApp.s6, horizontal: SizeApp.s16),
          color: ColorsApp.redOrigin.withAlpha(100),
          child: Text(
            'Required',
            style: TextStyle(
                color: ColorsApp.textColor,
                fontSize: SizeApp.s12,
                fontWeight: FontWeightApp.regular),
          ),
        )
      ],
    );
  }

  Widget _renderAppBar(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImagesApp.bannerImages1,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: SizeApp.s40,
          left: SizeApp.s16,
          child: Container(
            height: SizeApp.s30,
            width: SizeApp.s30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.close,
                  color: Colors.white, size: SizeApp.s16),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
