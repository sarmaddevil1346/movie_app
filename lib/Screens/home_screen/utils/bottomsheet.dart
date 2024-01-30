import 'package:flutter/material.dart';

import '../../../Utils/button.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class BottomSheetSection {
  Future displayBottomSheet(context) {
    return showModalBottomSheet(
      barrierColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: AppColors.loginColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/studio_logo.png",
                  height: 112,
                  width: 172,
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
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/premium-quality.png",
                  height: 112,
                  width: 172,
                ),
                SizedBox(
                  height: 20,
                ),
                const DefaultTextDecoration(
                  text: "Unlimited Access",
                  fontWeight: FontWeight.w700,
                  textSize: 20,
                  textColor: AppColors.whiteColor,
                ),
                SizedBox(
                  height: 20,
                ),
                const DefaultTextDecoration(
                  text: "Get Access to all our features.",
                  textSize: 18,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.whiteColor,
                ),
                SizedBox(
                  height: 20,
                ),
                const DefaultTextDecoration(
                  text: "Choose a Plan",
                  textSize: 20,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.whiteColor,
                ),
                SizedBox(
                  height: 15,
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
                SizedBox(
                  height: 20,
                ),
                const DefaultTextDecoration(
                  text: "Trial Period: 1 Month Free",
                  textSize: 18,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.whiteColor,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: "Continue",
                  style: TextStyle(
                    color: AppColors.loginColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
