import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/home_screen.dart';
import 'package:test_project/screens/initial_screen.dart';
import 'package:test_project/screens/stamp_details_screen.dart';
import 'package:test_project/screens/store_info_edit_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('ja', null).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => const InitialScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/stampDetails', page: () => const StampDetailsScreen()),
        GetPage(name: '/editStoreInfo', page: () => StoreInfoEditScreen()),
      ],
    );
  }
}
