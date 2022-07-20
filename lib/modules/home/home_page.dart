import 'package:demoproject/modules/home/home_screen.dart';
import 'package:demoproject/modules/voucher/voucher_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/constant/app_color.dart';
import '../other/other_screen.dart';
import '../product/product_screen.dart';
import '../store/store_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const ProductScreen(),
    const StoreScreen(),
    const VoucherScreen(),
    const OtherScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.topSpace,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.coffee,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_outlined,
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.ticket,
            ),
            label: 'voucher',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'Other',
          ),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
        unselectedItemColor: Colors.black87,
        selectedItemColor: AppColor.primary,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedFontSize: 20,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
