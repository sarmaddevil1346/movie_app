import 'package:flutter/material.dart';

import '../../../Utils/button.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class BottomSheetSection {
  Future displayBottomSheet(context) {
    return showModalBottomSheet(
      elevation: 0,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
              color: AppColors.loginColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/studio_logo.png",
                  height: 100,
                  width: 150,
                ),
                const Text(
                  "Cinem-Amatoriale",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
                const Text(
                  "Tutti Film Che Vuol Quando Li Vuoi Tu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/premium-quality.png",
                  height: 102,
                  width: 152,
                ),
                const SizedBox(
                  height: 15,
                ),
                const DefaultTextDecoration(
                  text: "Unlimited Access",
                  fontWeight: FontWeight.w700,
                  textSize: 20,
                  textColor: AppColors.whiteColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const DefaultTextDecoration(
                  text: "Get Access to all our features.",
                  textSize: 18,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.whiteColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const DefaultTextDecoration(
                  text: "Choose a Plan",
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 82,
                  width: 194,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultTextDecoration(
                        text: "\$8.79",
                        fontWeight: FontWeight.w600,
                        textSize: 24,
                        textColor: AppColors.whiteColor,
                      ),
                      DefaultTextDecoration(
                        text: "Month",
                        fontWeight: FontWeight.w600,
                        textSize: 24,
                        textColor: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const DefaultTextDecoration(
                  text: "Trial Period: 1 Month Free",
                  textSize: 18,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.whiteColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonWidget(
                  text: "Continue",
                  style: const TextStyle(
                    color: AppColors.loginColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
