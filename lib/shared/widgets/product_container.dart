// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:demoproject/shared/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/models/product_model.dart';
import 'package:intl/intl.dart';

class ProductContainer extends StatelessWidget {
  final Products products;
  const ProductContainer({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: products.imgProduct == null
                ? Image(
                    image: AssetImage('assets/images/image-none.png'),
                    width: 100,
                    height: 100,
                  )
                : Image.network(
                    '${products.imgProduct}',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${products.productName}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${products.description}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    NumberFormat.currency(locale: 'vi', symbol: 'đ')
                        .format(products.price),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.add_circled),
            color: AppColor.primary,
          )
        ],
      ),
    );
  }
}
