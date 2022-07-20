// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final bool isStickers;

  const CircleButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
    this.isStickers = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          decoration: BoxDecoration(
              color: AppColor.patternsBlue,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: AppColor.primary)),
          child: IconButton(
            icon: Icon(
              icon,
              color: AppColor.primary,
            ),
            iconSize: iconSize,
            onPressed: () {
              onPressed();
            },
          ),
        ),
        isStickers
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.red.shade600,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
