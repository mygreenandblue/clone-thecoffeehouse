
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:demoproject/shared/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, this.products, this.id}) : super(key: key);
  final Products? products;
  final String? id;

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _price = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _price = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.12,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.network(
                          '${widget.products!.imgProduct}',
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        '${widget.products!.productName}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'vi',
                                        symbol: 'đ',
                                      ).format(widget.products!.price),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  child: const Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  '${widget.products!.description}.',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 8,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Topping',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              'Chọn tối đa 2 loại topping',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Nhỏ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Vừa",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Lớn",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              indent: 15,
                              height: 0,
                              color: AppColor.primary,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: false,
                                    checkColor: Colors.green,
                                    activeColor: Colors.white,
                                    side:
                                        const BorderSide(color: Colors.black87),
                                    onChanged: (value) {
                                      // ignore: avoid_print
                                      print('object');
                                    }),
                                const Text(
                                  "Kem phô mai Macchiato",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '10.000đ',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: GestureDetector(
                        child: const Icon(
                          CupertinoIcons.clear_circled,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: AppColor.topSpace,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_price > 0) {
                                      _price = _price - 1;
                                     
                                    } else {
                                      _price = _price;
                                     
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: AppColor.primary,
                                  size: 30,
                                )),
                            Text('$_price'),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_price < 8) {
                                      _price = _price + 1;
                                    } else {
                                      _price = _price;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  color: AppColor.primary,
                                  size: 30,
                                )),
                            const Spacer(),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 12, 25, 12),
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12)),
                              child: GestureDetector(
                                  child: Row(
                                children: [
                                  const Text(
                                    'Chọn',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.album,
                                    size: 4,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'vi',
                                      symbol: 'đ',
                                    ).format(widget.products!.price),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
