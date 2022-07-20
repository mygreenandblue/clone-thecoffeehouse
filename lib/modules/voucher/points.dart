import 'package:flutter/material.dart';
import 'package:demoproject/shared/data_sources/fake_data.dart';
import 'package:demoproject/shared/widgets/widgets.dart';

class AccumulatePoints extends StatelessWidget {
  const AccumulatePoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeAll(
          title: 'Phiếu ưu đãi của bạn',
          // ignore: avoid_print
          onPressed: () => print('see all'),
        ),
        ListView.builder(
            // the number of items in the list
            itemCount: vouchers.length,

            // display each item of the product list
            itemBuilder: (context, index) {
              return Card(
                // In many cases, the key isn't mandatory
                key: ValueKey(vouchers[index]),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(vouchers[index].name)),
              );
            }),
        SeeAll(
          title: 'Đổi ưu đãi',
          onPressed: () =>{},
        ),
      ],
    );
  }
}
