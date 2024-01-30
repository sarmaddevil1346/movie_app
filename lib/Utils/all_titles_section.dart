import 'package:flutter/material.dart';

import 'text.dart';
import '../constants/colors.dart';

class HomeTitleSection {
  Widget buildSectionTitle(String title,
      {String? subtitle,
      final textSize,
      FontWeight fontWeight = FontWeight.bold}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextDecoration(
          text: title,
          textSize: 20,
          textColor: AppColors.whiteColor,
          fontWeight: fontWeight,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 5),
          DefaultTextDecoration(
            text: subtitle,
            textSize: textSize,
            textColor: AppColors.whiteColor,
          ),
        ],
      ],
    );
  }
}
