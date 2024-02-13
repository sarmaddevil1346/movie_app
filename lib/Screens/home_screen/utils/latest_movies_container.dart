import 'package:flutter/material.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';
import '../../../Utils/side_cut_clipper.dart';
import '../../video_player/video_player.dart';

class LatestMovieSection extends StatelessWidget {
  LatestMovieSection({
    super.key,
    required this.imagePath,
    this.genre = "",
    this.category = "",
    this.onTap,
    this.color,
    this.gradient,
    this.title = "",
    this.iconColor,
    this.container,
    required this.index,
  });

  final String category;
  final String genre;
  final LinearGradient? gradient;
  final Color? color;
  final Color? iconColor;
  final VoidCallback? onTap;
  final String imagePath;
  final String? title;
  final Container? container;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      width: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: SideCutClipper(),
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 154,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 154,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(
                          imagePath,
                        ),
                      )),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        DefaultTextDecoration(
                          text: genre.toString(),
                          textSize: 16,
                          fontWeight: FontWeight.w300,
                          textColor: AppColors.whiteColor,
                        ),
                        Expanded(
                          child: DefaultTextDecoration(
                            text: title.toString(),
                            textSize: 15,
                            fontWeight: FontWeight.w700,
                            textColor: AppColors.whiteColor,
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        if (container != null) ...[
                          Align(alignment: Alignment.center, child: container!),
                        ],
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 22,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: gradient,
                  color: color),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerWidget(
                          index: index,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.play_arrow,
                    color: iconColor,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
