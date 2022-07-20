import 'package:demoproject/shared/constant/app_color.dart';
import 'package:demoproject/shared/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/data_sources/fake_data.dart';
import 'package:demoproject/shared/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Discovery discovery;
  int hourNow = DateTime.now().hour;
  List<Discovery> discoveries = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // _getEvent();
  }

  // ignore: unused_element
  void _getEvent() async {
    setState(() => _isLoading = true);
    // ignore: await_only_futures
    discoveries = await discoveries;
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            HeaderContainer(),
            SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 350.0,
                elevation: 1,
                flexibleSpace: Container(
                  color: AppColor.moonstone,
                  child: FlexibleSpaceBar(
                      background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              AppColor.patternsBlue, BlendMode.color),
                          image: const AssetImage(
                              'assets/images/backgroundCodeUser.png'),
                          fit: BoxFit.cover),
                    ),
                    // color: AppColor.moonstone,
                    child: _buildCard(),
                  )),
                )),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  color: AppColor.moonstone,
                  child: Column(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                        decoration: BoxDecoration(
                            color: AppColor.topSpace,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 3,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const ShippingMethodContainer(),
                            const SizedBox(
                              height: 20,
                            ),
                            CarouselSliderData(carousels),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 8.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.flame_fill,
                      size: 22,
                      color: Colors.orange.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Khám phá thêm',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
              sliver: _isLoading
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return DiscoveryContainer(
                              discovery: discoveryList[index], onTap: () {});
                        },
                        childCount: discoveryList.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 0.65,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                    colors: [AppColor.topSpace, AppColor.primary]),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.textFieldColor),
                          color: AppColor.topSpace,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
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
                    ],
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
                    child: const Image(
                        image: AssetImage('assets/images/barcode.png')),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
