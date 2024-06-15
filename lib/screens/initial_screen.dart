import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/app/dimensions.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Initial Screen',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 168, 177, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: appHeight(context),
            width: appWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 168, 177, 255),
                    ),
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    child: const Text(
                      'Home Screen',
                      style: TextStyle(color: Colors.white),
                    )),
                vSizedBox1,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 168, 177, 255),
                    ),
                    onPressed: () {
                      Get.toNamed('/stampDetails');
                    },
                    child: const Text(
                      'Stamp Details Screen',
                      style: TextStyle(color: Colors.white),
                    )),
                vSizedBox1,
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 168, 177, 255),
                    ),
                    onPressed: () {
                      Get.toNamed('/editStoreInfo');
                    },
                    child: const Text(
                      'Edit Store Info Screen',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
