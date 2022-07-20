import 'package:demoproject/modules/store/store_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/constant/app_color.dart';
import '../../shared/data_sources/fake_data.dart';
import '../../shared/widgets/widgets.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _editingController = TextEditingController();

  int _charLength = 0;
  bool _status = false;

  @override
  void initState() {
    super.initState();
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
          title: Text(
            'Cửa hàng',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
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
              onPressed: () => {},
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
                title: Expanded(
                  child: Container(
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
                            color: Colors.black,
                          ),
                          Expanded(
                            child: TextFormField(
                              key: _formKey,
                              // autofocus: true,
                              controller: _editingController,
                              textInputAction: TextInputAction.search,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Tìm kiếm của hàng',
                                border: InputBorder.none,
                              ),
                              onSaved: (value) => _editingController.text,
                              onChanged: (value) {
                                _onChangedText(value);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _status,
                            child: IconButton(
                              onPressed: _clearAll,
                              icon: const Icon(Icons.clear),
                              iconSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.map_outlined,
                            size: 17,
                            color: Colors.grey.shade800,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Bản đồ',
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 14,
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
                padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Danh sách của hàng',
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
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 5.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StoreDetail(
                                      store: storeList[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsetsDirectional.all(12.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    '${storeList[index].imageUrl}',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          '${storeList[index].name}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                          maxLines: 20,
                                          overflow: TextOverflow.ellipsis,
                                          textWidthBasis:
                                              TextWidthBasis.longestLine,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Cách đây khoảng ${storeList[index].long} km',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                      childCount: storeList.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
