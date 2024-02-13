import 'package:flutter/material.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Models/sago_screen_models.dart';
import '../Trilogy3/trilogy3.dart';

class SagaScreen extends StatelessWidget {
  const SagaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DefaultTextDecoration(
                text: "Sago",
                textSize: 40,
                fontWeight: FontWeight.w700,
                textColor: AppColors.loginColor,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: sagoScreenImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Trilogy(),
                          ),
                        );
                      },
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: sagoContainerSection(index: index)),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class sagoContainerSection extends StatelessWidget {
  sagoContainerSection({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 152,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(sagoScreenImages[index]),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            image: AssetImage('assets/images/sago_shadow.png'),
          ),
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultTextDecoration(
                  text: "The Shepherd",
                  textColor: AppColors.whiteColor,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }
}
