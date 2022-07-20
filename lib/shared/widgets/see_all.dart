// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';

class SeeAll extends StatelessWidget {
  final String? title;
  final Function onPressed;
  const SeeAll({Key? key, this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: onPressed(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Xem tất cả',
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
