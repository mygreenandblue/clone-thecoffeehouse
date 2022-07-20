import 'package:flutter/material.dart';
import 'package:demoproject/modules/voucher/redeem_list.dart';
import 'package:demoproject/shared/data_sources/fake_data.dart';
import 'package:demoproject/shared/widgets/widgets.dart';

class RedeemOffer extends StatelessWidget {
  const RedeemOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SeeAll(
              title: 'Từ AHA Coffee',
              onPressed: () => {},
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: RedeemOfferList(voucher: vouchers),
            ),
          ),
          SliverToBoxAdapter(
            child: SeeAll(
              title: 'Từ đối tác',
              onPressed: () => {},
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: GestureDetector(
                    onTap: () => {
                      // showModalBottomSheet<void>(
                      //   isScrollControlled: true,
                      //   context: context,
                      //   backgroundColor: Colors.black,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(20),
                      //       topRight: Radius.circular(20),
                      //     ),
                      //   ),
                      // builder: (BuildContext context) =>
                      // StoreDetail(),
                      // ),
                    },
                    // child: StoreContainer(product: products[index]),
                    child: const Text('data'),
                  ),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
