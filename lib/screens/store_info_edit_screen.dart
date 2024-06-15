import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/widgets/custom_check_box_grid.dart';
import 'package:test_project/widgets/custom_text.dart';
import 'package:test_project/widgets/custom_text_drop_down.dart';
import 'package:test_project/widgets/custom_text_image_widget.dart';
import 'package:test_project/widgets/custom_text_time_picker.dart';
import 'package:test_project/widgets/store_details_form_widget.dart';

class StoreInfoEditScreen extends StatelessWidget {
  StoreInfoEditScreen({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/back.svg'),
                    onPressed: () {
                      Get.toNamed('/');
                    },
                  ),
                  CustomText(
                    text: '店舗プロフィール編集',
                    size: 15.sp,
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/notifications.svg'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 231, 231, 231),
            ),
            vSizedBox2,
            const StoreDetailsFormWidget(
              title: '店舗名',
              data: 'Mer キッチン',
            ),
            const StoreDetailsFormWidget(
              title: '代表担当者名',
              data: '林田　絵梨花',
            ),
            const StoreDetailsFormWidget(
              title: '店舗電話番号',
              data: '123 - 4567 8910',
            ),
            const StoreDetailsFormWidget(
              title: '店舗住所',
              data: '大分県豊後高田市払田791-13',
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              width: appWidth(context),
              height: appHeight(context) / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.fill)),
            ),
            const CustomTextImageWidget(
              pText: '店舗外観',
              text: '最大3枚まで',
              image1: 'assets/images/image3.png',
              image2: 'assets/images/image3.png',
              image3: 'assets/images/image.png',
            ),
            Column(
              children: [
                const CustomRequiredText(
                    pText: '店舗内観', text: '1枚〜3枚ずつ追加してください'),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                  child: Row(
                    children: [
                      Image.asset('assets/images/image4.png'),
                      hSizedBox0,
                      Image.asset('assets/images/image4.png'),
                      hSizedBox0,
                      Image.asset(
                        'assets/images/image4.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomTextImageWidget(
              pText: '料理写真',
              text: '1枚〜3枚ずつ追加してください',
              image1: 'assets/images/image5.png',
              image2: 'assets/images/image6.png',
              image3: 'assets/images/image7.png',
            ),
            const CustomTextImageWidget(
              pText: 'メニュー写真',
              text: '1枚〜3枚ずつ追加してください',
              image1: 'assets/images/image8.png',
              image2: 'assets/images/image9.png',
              image3: 'assets/images/image10.png',
            ),
            CustomTextTimePicker(
              text: '営業時間',
            ),
            vSizedBox1,
            CustomTextTimePicker(
              text: 'ランチ時間',
            ),
            vSizedBox2,
            Column(
              children: [
                RequiredText(
                  text: '定休日',
                  size: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: const CheckboxGrid(
                    isClosingDay: true,
                    labels: ['月', '火', '水', '木', '金', '土', '日', '祝'],
                    crossAxisCount: 4,
                  ),
                ),
              ],
            ),
            vSizedBox2,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RequiredText(
                  text: '料理カテゴリー',
                  size: 14,
                  fontWeight: FontWeight.w700,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: CustomTextDropdownButton(
                    controller: textController,
                    items: const ['料理カテゴリー選択', '料理写真', '予算', 'キャッチコピー'],
                  ),
                ),
              ],
            ),
            vSizedBox2,
            Column(
              children: [
                const RequiredText(text: '予算'),
                vSizedBox0,
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    children: [
                      Container(
                        width: appWidth(context) / 3,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color.fromARGB(255, 231, 231, 231),
                          ),
                        ),
                        child: CustomText(
                          text: '¥ 1,000',
                          size: 16.sp,
                        ),
                      ),
                      hSizedBox1,
                      SvgPicture.asset('assets/icons/til.svg'),
                      hSizedBox1,
                      Container(
                        width: appWidth(context) / 3,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color.fromARGB(255, 231, 231, 231),
                          ),
                        ),
                        child: CustomText(
                          text: '¥ 2,000',
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            vSizedBox2,
            const StoreDetailsFormWidget(
              title: 'キャッチコピー',
              data: '美味しい！リーズナブルなオムライスランチ！',
            ),
            const StoreDetailsFormWidget(
              title: '座席数',
              data: '40席',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  RequiredText(
                    text: '喫煙席',
                    size: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  CheckboxGrid(
                    isSmokingSeat: true,
                    labels: ['有', '無'],
                    crossAxisCount: 2,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  RequiredText(
                    text: '駐車場',
                    fontWeight: FontWeight.w700,
                  ),
                  CheckboxGrid(
                    isParking: true,
                    labels: ['有', '無'],
                    crossAxisCount: 2,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  RequiredText(
                    text: '来店プレゼント',
                    fontWeight: FontWeight.w700,
                  ),
                  CheckboxGrid(
                    isVisit: true,
                    labels: ['有（最大３枚まで）', '無'],
                    crossAxisCount: 2,
                  ),
                ],
              ),
            ),
            const CustomTextImageWidget(
              pText: '',
              text: '',
              image1: 'assets/images/image11.png',
              image2: 'assets/images/image12.png',
              image3: 'assets/images/image13.png',
              imageOnly: true,
            ),
            const StoreDetailsFormWidget(
              title: '来店プレゼント名',
              data: 'いちごクリームアイスクリーム, ジュース',
            ),
            vSizedBox2,
            Container(
              width: appWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [Color(0xFFEE7D42), Color(0xFFFFC8AB)],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: CustomText(
                  text: '編集を保存',
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            vSizedBox2,
          ],
        ),
      )),
    );
  }
}
