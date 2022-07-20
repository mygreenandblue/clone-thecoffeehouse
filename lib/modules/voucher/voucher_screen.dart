import 'package:demoproject/modules/voucher/slider_gradient.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/data_sources/fake_data.dart';
import 'package:demoproject/shared/widgets/widgets.dart';

import 'redeem_list.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VoucherScreenState createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  bool _isPoint = true;
  bool _isRedeem = false;
  final double _value = 100;
  final String _statusRank = 'Mới';
  final String _rank = 'Đồng';
  LinearGradient gradient = LinearGradient(colors: <Color>[
    AppColor.textFieldColor.withOpacity(0.8),
    AppColor.primary
  ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // expandedHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Text(
              'Ưu đãi',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            elevation: 0,

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
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPoint = true;
                          _isRedeem = false;
                        });
                      },
                      child: _isPoint
                          ? Container(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              decoration: BoxDecoration(
                                  color: AppColor.topSpace,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Tích điểm',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColor.primary),
                              ))
                          : Container(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              color: Colors.white,
                              child: const Text(
                                'Tích điểm',
                                textAlign: TextAlign.center,
                              )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isRedeem = true;
                          _isPoint = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RedeemOfferList()),
                          );
                        });
                      },
                      child: _isRedeem
                          ? Container(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              decoration: BoxDecoration(
                                  color: AppColor.topSpace,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Đổi ưu đãi',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: AppColor.primary),
                              ))
                          : Container(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              color: Colors.white,
                              child: const Text(
                                'Đổi ưu đãi',
                                textAlign: TextAlign.center,
                              )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              sliver: SliverToBoxAdapter(
                child: Container(
                    color: AppColor.whiteSmoke,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            _buildCard(),
                            SliderTheme(
                                data: SliderThemeData(
                                  trackShape: GradientRectSliderTrackShape(
                                      gradient: gradient, darkenInactive: true),
                                ),
                                child: Slider(
                                  divisions: 10,
                                  thumbColor: AppColor.primary,
                                  min: 0,
                                  max: 100,
                                  value: _value,
                                  onChanged: (double value) {
                                    null;
                                  },
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 12),
                              child: Row(
                                children: [
                                  Text(
                                    _statusRank,
                                  ),
                                  const Spacer(),
                                  Text(
                                    _rank,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                                padding: EdgeInsets.only(left: 15, right: 12),
                                child: Text(
                                  'Còn 100 BEAN nữa để thăng hạng. Đổi quà không ảnh hưởng đến việc thăng hạng của bạn.',
                                  textAlign: TextAlign.center,
                                )),
                            const SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                    )),
              )),
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.gift,
                                    size: 25,
                                    color: AppColor.primary,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Đổi ưu đãi',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    CupertinoIcons.ticket,
                                    size: 25,
                                    color: AppColor.primary,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Voucher của bạn',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.coffee,
                                    size: 25,
                                    color: AppColor.primary,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Lịch sử BEAN',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.security,
                                    size: 25,
                                    color: AppColor.primary,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Quyền lợi của bạn',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
            sliver: SliverToBoxAdapter(
              child: SeeAll(
                onPressed: () {},
                title: 'Phiếu ưu đãi của bạn',
              ),
              // child: Row(
              //   children: [
              //     Text(
              //       'Phiếu ưu đãi của bạn',
              //       style: TextStyle(
              //         color: Colors.grey.shade800,
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const Spacer(),
              //     SeeAll(title: '', onPressed: () {})
              //   ],
              // ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 3.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    // generate ambers with random shades
                    color: Colors.white,
                    child: Container(
                      alignment: Alignment.center,
                      child: VoucherListContainer(voucher: vouchers[index]),
                    ),
                  );
                },
                childCount: vouchers.length,
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildCard() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            gradient:
                LinearGradient(colors: [AppColor.topSpace, AppColor.primary]),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 240, right: 20),
                child: Container(
                  height: 35,
                  // width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.textFieldColor),
                    color: AppColor.topSpace,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        'Tích điểm',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Row(children: <Widget>[
                  Column(
                    children: [
                      const Text('Cong Giap'),
                      const SizedBox(height: 4),
                      Row(children: const [
                        Text('0 BEAN'),
                        SizedBox(width: 2),
                        Icon(
                          Icons.album,
                          size: 4,
                        ),
                        SizedBox(width: 2),
                        Text('Mới')
                      ])
                    ],
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child:
                    const Image(image: AssetImage('assets/images/barcode.png')),
              )
            ],
          ),
        ),
      ],
    );
  }
}
