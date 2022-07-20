
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            height: MediaQuery.of(context).size.height / 1.12,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: 20,
                      ),
                      const Spacer(),
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        child: const Text(
                          'Danh mục',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            child: const Icon(
                              CupertinoIcons.clear,
                              size: 20,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          )),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Icon(
                                        CupertinoIcons.clock,
                                        size: 35,
                                        color: AppColor.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Đạt gần đây',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.textFieldColor),
                                        child: Icon(
                                          Icons.coffee,
                                          size: 35,
                                          color: AppColor.yellow,
                                        )),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Cà phê',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.coffee_maker_sharp,
                                            size: 35,
                                            color: Colors.brown,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Thưởng thức tại nhà',
                                          maxLines: 4,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Icon(
                                        Icons.cloud_upload_outlined,
                                        size: 35,
                                        color: AppColor.bgColorError,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('CloudFee',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Icon(
                                        CupertinoIcons.clock,
                                        size: 35,
                                        color: AppColor.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Đạt gần đây',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.textFieldColor),
                                        child: Icon(
                                          Icons.coffee,
                                          size: 35,
                                          color: AppColor.yellow,
                                        )),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Cà phê',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.coffee_maker_sharp,
                                            size: 35,
                                            color: Colors.brown,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('Thưởng thức tại nhà',
                                          maxLines: 4,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.textFieldColor),
                                      child: Icon(
                                        Icons.cloud_upload_outlined,
                                        size: 35,
                                        color: AppColor.bgColorError,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const SizedBox(
                                      width: 60,
                                      child: Text('CloudFee',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
