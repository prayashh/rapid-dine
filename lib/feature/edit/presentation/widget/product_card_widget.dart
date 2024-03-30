import 'package:digital_menu/config/colors.dart';
import 'package:digital_menu/feature/edit/presentation/widget/custom_card.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  final String itemName;
  final String description;
  final String category;
  final double price;
  final String imageUrl;

  const CustomProductCard({
    Key? key,
    required this.itemName,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(w * 0.04),
      height: h * 0.15,
      width: w * 0.9,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(w * 0.005),
              height: h * 0.15,
              width: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                ),
                color: beidge,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imageUrl.toString()),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: beidge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.04,
                    width: double.maxFinite,
                    child: Text(
                      itemName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                    width: double.maxFinite,
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.04,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCard(
                          textColor: red,
                          width: 0.22,
                          text: "Price",
                          color: beidge,
                          outlineColor: red,
                        ),
                        CustomCard(
                          textColor: beidge,
                          width: 0.22,
                          text: "₹ $price",
                          color: red,
                          outlineColor: red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: h * 0.15,
                color: beidge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_document,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
