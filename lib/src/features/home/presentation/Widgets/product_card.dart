// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../utils/src/ui_dimens.dart';
import '../../../../utils/src/utils.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  }) : super(key: key);

  final String title;
  final String price;
  final String image;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIDimens.size5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ).paddingLTRB(Utils.getScreenWidth(context, 8), 0,
              Utils.getScreenWidth(context, 8), 0),
          SizedBox(
              height: Utils.getScreenHeight(context, 147),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                Utils.getScreenWidth(context, 11),
                0,
                Utils.getScreenWidth(context, 11),
                Utils.getScreenHeight(context, 6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Rating: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          rating,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                const PhysicalModel(
                  color: Colors.white,
                  elevation: 3,
                  shape: BoxShape.circle,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.purple,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
