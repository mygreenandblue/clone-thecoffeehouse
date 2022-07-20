import 'package:demoproject/modules/product/product_detail.dart';
import 'package:demoproject/shared/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import '../../shared/data_sources/fake_data.dart';
import '../../shared/widgets/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'category.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _editingController = TextEditingController();
  bool _isLike = false;
  int _charLength = 0;
  bool _status = false;
  Products? products;
  List<Products> favourites = [];
  @override
  void initState() {
    super.initState();
  }

  void dismissSlidableItem(BuildContext context) {
    if (_isLike == true) {
      setState(() {
        _isLike = false;
      });
    } else {
      setState(() {
        _isLike = true;
      });
    }
    Utils.showSnackBar(context, _isLike);
  }

  _onChangedText(String value) {
    setState(() {
      _charLength = value.length;
    });

    if (_charLength > 0) {
      setState(() {
        _status = true;
      });
    } else {
      setState(() {
        _status = false;
      });
    }
  }

  _clearAll() {
    setState(() {
      _formKey.currentState?.reset();
      _editingController.clear();
      _status = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.white,
          titleSpacing: 15.0,
          title: Row(
            children: [
              Text(
                'Danh mục',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                  onPressed: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const Category();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black87,
                  ))
            ],
          ),
          actions: [
            CircleButton(
              icon: CupertinoIcons.tickets,
              iconSize: 24.0,
              onPressed: () => {},
            ),
            CircleButton(
              icon: CupertinoIcons.bell,
              iconSize: 24.0,
              onPressed: () {},
              isStickers: true,
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.unfocus();
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 0.5,
                backgroundColor: Colors.white,
                titleSpacing: 15.0,
                floating: false,
                pinned: true,
                title: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 0),
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: AppColor.topSpace,
                        border: Border.all(
                            color: AppColor.textFieldColor, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black87,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              controller: _editingController,
                              textInputAction: TextInputAction.search,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: "Tìm kiếm sản phẩm",
                                border: InputBorder.none,
                              ),
                              onSaved: (value) => _editingController.text,
                              onChanged: (value) {
                                _onChangedText(value);
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _status,
                          child: IconButton(
                            onPressed: _clearAll,
                            icon: const Icon(Icons.clear),
                            iconSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            size: 30,
                            color: Colors.grey.shade800,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Yêu thích',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 0.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Danh sách sản phẩm',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        CupertinoIcons.wand_stars,
                        size: 22,
                        color: Colors.yellow.shade600,
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return ProductDetail(
                                    products: productList[index],
                                    id: productList[index].productId,
                                  );
                                },
                              );
                            },
                            child: Slidable(
                                key: Key(
                                    productList[index].productId.toString()),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: _isLike
                                          ? SlidableAction(
                                              // autoClose: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              onPressed: dismissSlidableItem,
                                              backgroundColor: AppColor.primary
                                                  .withOpacity(0.8),
                                              foregroundColor: Colors.red,
                                              icon: CupertinoIcons.heart_fill,
                                              spacing: 4,
                                              label: 'Thích',
                                            )
                                          : SlidableAction(
                                              // autoClose: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12)),
                                              onPressed: dismissSlidableItem,
                                              backgroundColor: AppColor.primary
                                                  .withOpacity(0.8),
                                              foregroundColor: Colors.white,
                                              icon: CupertinoIcons.heart,
                                              spacing: 4,
                                              label: 'Thích',
                                            ),
                                    ),
                                  ],
                                ),
                                child: ProductContainer(
                                  products: productList[index],
                                )),
                          ),
                      childCount: productList.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Utils {
  static void showSnackBar(BuildContext context, bool check) =>
      Scaffold.of(context)
        // ignore: deprecated_member_use
        ..hideCurrentSnackBar()
        // ignore: deprecated_member_use
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            // margin: EdgeInsets.all(5),
            content: Row(
              children: [
                const Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 22,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  check
                      ? 'Đã thêm vào danh sách yêu thích'
                      : 'Đã xóa khỏi danh sách yêu thích',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
}

// void dismissSlidableItem(BuildContext context) {
//   const bool check = true;
//   Utils.showSnackBar(context, check);
// }
