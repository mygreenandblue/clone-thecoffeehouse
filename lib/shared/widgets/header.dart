import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/widgets/widgets.dart';

import '../constant/app_color.dart';

// ignore: must_be_immutable
class HeaderContainer extends StatelessWidget {
  int hourNow = DateTime.now().hour;
  HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.moonstone,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(width: 15),
          Icon(
            hourNow >= 6 && hourNow <= 18
                ? CupertinoIcons.sun_max_fill
                : CupertinoIcons.moon_stars_fill,
            size: 30,
            color: hourNow >= 6 && hourNow <= 18
                ? Colors.yellow.shade700
                : Colors.blueGrey.shade600,
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Text(
                hourNow >= 6 && hourNow <= 12
                    ? 'Chào buổi sáng'
                    : hourNow > 12 && hourNow < 18
                        ? 'Chào buổi chiều'
                        : hourNow >= 18
                            ? 'Chào buổi tối'
                            : hourNow > 23 || hourNow < 6
                                ? 'Ngủ ngon nhé'
                                : '',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          )
        ],
      ),
      elevation: 0,
      floating: true,
      pinned: true,
      actions: [
        CircleButton(
          icon: CupertinoIcons.tickets,
          iconSize: 24.0,
          onPressed: () {},
        ),
        CircleButton(
          icon: CupertinoIcons.bell,
          iconSize: 24.0,
          onPressed: () {},
          isStickers: true,
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
