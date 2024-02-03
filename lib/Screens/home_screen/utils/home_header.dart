import 'package:flutter/material.dart';
import 'package:movie_app/Screens/home_screen/utils/bottomsheet.dart';
import 'package:movie_app/Screens/profile_screen/profile_screen.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class HomeHeaderUtilities {
  final BottomSheetSection _bottomSheetSection = BottomSheetSection();

  Widget buildHeaderRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/images/profile_person.png"),
          ),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextDecoration(
              text: 'Good Morning',
              textColor: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              textSize: 20,
            ),
            DefaultTextDecoration(
              text: 'Jane Cooper',
              textColor: AppColors.whiteColor,
              fontWeight: FontWeight.w300,
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
