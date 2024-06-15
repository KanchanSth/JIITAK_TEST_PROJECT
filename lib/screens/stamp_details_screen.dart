import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/widgets/custom_text.dart';

class StampDetailsScreen extends StatelessWidget {
  const StampDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 177, 255),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/back_button.svg'),
                      onPressed: () {
                        Get.toNamed('/');
                      },
                    ),
                    CustomText(
                        text: 'スタンプカード詳細', size: 14.sp, color: Colors.white),
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/minus_circle.svg'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Mer キッチン',
                        size: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: '現在の獲得数',
                            size: 14.sp,
                            color: Colors.white,
                          ),
                          hSizedBox1,
                          CustomText(
                            text: '30',
                            size: 28.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          hSizedBox1,
                          CustomText(
                            text: '個',
                            size: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: appHeight(context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vSizedBox1,
                        Center(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              viewportFraction: 0.95,
                            ),
                            items: [
                              'assets/images/card.png',
                              'assets/images/card.png',
                            ].map((imagePath) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Image.asset(imagePath,
                                        fit: BoxFit.cover),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CustomText(
                              text: '2 / 2枚目',
                              size: 12.sp,
                              color: const Color.fromARGB(255, 69, 69, 69),
                            ),
                          ),
                        ),
                        CustomText(
                          text: 'スタンプ獲得履歴',
                          size: 14.sp,
                          color: const Color.fromARGB(255, 69, 69, 69),
                          fontWeight: FontWeight.bold,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, item) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: CustomText(
                                      text: DateFormat('yyyy / MM / dd').format(
                                          DateTime.now()
                                              .subtract(Duration(days: item))),
                                      size: 12.sp,
                                      color: const Color.fromARGB(
                                          255, 181, 181, 181),
                                    ),
                                    subtitle: CustomText(
                                      text: 'スタンプを獲得しました。',
                                      size: 14.sp,
                                    ),
                                    trailing: CustomText(
                                      text: '1 個',
                                      size: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onTap: () {},
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 231, 231, 231),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
