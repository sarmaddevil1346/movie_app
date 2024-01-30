import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home_screen/utils/bottomsheet.dart';
import 'package:movie_app/Utils/button.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class HomeHeaderUtilities {
  final BottomSheetSection _bottomSheetSection = BottomSheetSection();

  Widget buildHeaderRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(radius: 30),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextDecoration(
              text: 'Good Morning',
              textColor: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
              textSize: 20,
            ),
            DefaultTextDecoration(
              text: 'Jane Cooper',
              textColor: AppColors.whiteColor,
              textSize: 16,
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            _bottomSheetSection.displayBottomSheet(context);
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(07),
            ),
            child: Image.asset("assets/images/premium.png"),
          ),
        ),
      ],
    );
  }
}
