import 'package:amazon_project/widget/rating_stars_widget.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../screens/product_screen.dart';
import '../utils/colors_themes.dart';
import '../utils/utils.dart';
import 'cost_widget.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreenState(productModel: product)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                product.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(
                          child: RatingStarwidget(rating: product.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      product.noOfRating.toString(),
                      style: const TextStyle(color: activeCyancolor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: CostWiddddddget(
                    color: const Color.fromARGB(255, 92, 9, 3),
                    cost: product.cost),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
