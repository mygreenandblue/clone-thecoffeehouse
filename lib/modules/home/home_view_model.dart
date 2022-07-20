// import 'package:base_flutter/modules/home/home_view_model.dart';
// import 'package:base_flutter/shared/base/base_state_widget.dart';
// import 'package:base_flutter/shared/data/app_color.dart';
// import 'package:base_flutter/shared/data/app_config.dart';
// import 'package:base_flutter/shared/helpers/text_helper.dart';
// import 'package:base_flutter/shared/resources/modal_progress_hub.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({Key key}) : super(key: key);
//   @override
//   _HomeViewState createState() => _HomeViewState();
// }
// class _HomeViewState extends BaseState<HomeView, HomeViewModel> with TickerProviderStateMixin  {
//   HomeViewModel homeViewModel = HomeViewModel();
//   @override
//   Function(BuildContext context, HomeViewModel model, Widget child) builder() {
//     return (context, model, child) {
//       appConfig.heightScreen = MediaQuery.of(context).size.height;
//       appConfig.widthScreen = MediaQuery.of(context).size.width;
//       return ModalProgressHUD(
//         inAsyncCall: model.busy,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Trang chủ',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: TextHelper.setTextSize(24),
//               ),
//             ),
//             backgroundColor: AppColor.sideBarColor,
//             elevation: 0,
//             foregroundColor: AppColor.white,
//             iconTheme: const IconThemeData(color: Colors.white),
//           ),
//           body: const Center(),
//         ),
//       );
//     };
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   HomeViewModel model() => homeViewModel;
// }
