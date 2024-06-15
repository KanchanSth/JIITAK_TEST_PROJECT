import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/models/card_details_model.dart';
import 'package:test_project/widgets/custom_text.dart';

class CustomCardWidget extends StatelessWidget {
  final CardDetailsModel cardDetails;
  const CustomCardWidget({super.key, required this.cardDetails});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            height: appHeight(context) / 1.6,
            width: appWidth(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: (appHeight(context) / 1.6) / 2,
                      width: appWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16.0)),
                        image: DecorationImage(
                          image: AssetImage(cardDetails.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-5, 215),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 98, 98),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: CustomText(
                              text: cardDetails.daysLeft,
                              color: Colors.white,
                              size: 10,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Container(
                    height: (appHeight(context) / 1.6) / 2,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: cardDetails.title,
                          size: 13,
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAAA14).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: CustomText(
                                text: cardDetails.careServiceType,
                                color: const Color(0xFFFAAA14),
                                size: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CustomText(
                                text: cardDetails.price,
                                size: 16,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        vSizedBox1,
                        CustomText(
                          text: cardDetails.dateTime,
                          size: 12,
                        ),
                        vSizedBox1,
                        CustomText(
                          text: cardDetails.address,
                          size: 12,
                        ),
                        vSizedBox1,
                        CustomText(
                          text: cardDetails.transportExpense,
                          size: 12,
                        ),
                        vSizedBox1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: cardDetails.careProviderName,
                              size: 12,
                              color: const Color(0x303030).withOpacity(0.35),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/favourite.svg',
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
