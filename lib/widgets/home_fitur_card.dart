import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/routes/route_name.dart';
import 'package:parenteach/utils/utils.dart';

class HomeFiturCard extends StatelessWidget {
  final RouteName? route;
  final String? imageAsset;
  final String? titleCard;
  const HomeFiturCard({
    Key? key,
    required this.route,
    required this.imageAsset,
    required this.titleCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(routeName.reverse[route]!),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: pinkColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Image.asset(imageAsset!),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 8,
            ),
            child: Text(
              titleCard!,
              style: blackText.copyWith(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
