import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class PicImageSectionWidget {
  Widget buildPicImageSection() {
    return Positioned(
        top: -60,
        left: 0,
        right: 0,
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile_person.png"),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                  bottom: -15,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.loginColor, width: 3)),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: AppColors.loginColor,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
