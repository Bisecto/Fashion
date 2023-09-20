//
// import 'package:flutter/material.dart';
//
// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }
//
// class TabNavigator extends StatefulWidget {
//   const TabNavigator({super.key,  required this.navigatorKey, required this.tabItem});
//
//   final GlobalKey<NavigatorState> navigatorKey;
//   final String tabItem;
//
//   @override
//   State<TabNavigator> createState() => _TabNavigatorState();
// }
//
// class _TabNavigatorState extends State<TabNavigator> {
//   @override
//   Widget build(BuildContext context) {
//     late Widget child;
//     if (widget.tabItem == "Home") {
//       setState(() {
//         child = const HomePage();
//       });
//     } else if (widget.tabItem == "History") {
//       setState(() {
//         child = const HistoryPage();
//       });
//     }
//     else if (widget.tabItem == "Account") {
//       setState(() {
//         child = const AccountPage();
//       });
//     }
//
//     return Navigator(
//       key: widget.navigatorKey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(
//             builder: (context) => child
//         );
//       },
//     );
//   }
// }