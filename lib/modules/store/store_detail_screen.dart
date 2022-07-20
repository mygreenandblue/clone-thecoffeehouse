import 'package:demoproject/shared/models/store_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class StoreDetail extends StatefulWidget {
  final Store? store;
  const StoreDetail({Key? key, this.store}) : super(key: key);

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}
