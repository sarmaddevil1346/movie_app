import 'package:flutter/material.dart';
import 'package:movie_app/Screens/NavigationBar/navigation_screen.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/constants/colors.dart';

import '../../Utils/button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              const SizedBox(
                height: 20,
              ),
              const DefaultTextDecoration(
                text: "Profile",
                textColor: AppColors.loginColor,
                fontWeight: FontWeight.w700,
                textSize: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      const AssetImage("assets/images/profile_person.png"),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(24)),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: AppColors.loginColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const DefaultTextDecoration(
                      text: 'User Name',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 18,
                    ),
                    subtitle: const DefaultTextDecoration(
                      text: 'Jane Copper',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w300,
                      textSize: 16,
                    ),
                    trailing: Image.asset(
                        height: 20, width: 20, "assets/images/pencil.png"),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
                    endIndent: 5,
                    indent: 5,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  ListTile(
                    title: const DefaultTextDecoration(
                      text: 'Email',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 18,
                    ),
                    subtitle: const DefaultTextDecoration(
                      text: 'janecooper@gmail.com',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w300,
                      textSize: 16,
                    ),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
                    endIndent: 5,
                    indent: 5,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    title: const DefaultTextDecoration(
                      text: 'Password',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 18,
                    ),
                    subtitle: const DefaultTextDecoration(
                      text: '***************',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w300,
                      textSize: 16,
                    ),
                    trailing: Image.asset(
                        height: 20, width: 20, "assets/images/pencil.png"),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
                    endIndent: 5,
                    indent: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ListTile(
                    title: DefaultTextDecoration(
                      text: 'Premium Plan',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      textSize: 18,
                    ),
                    subtitle: DefaultTextDecoration(
                      text: 'View your plan',
                      textColor: AppColors.whiteColor,
                      fontWeight: FontWeight.w300,
                      textSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                text: 'Update',
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                color: AppColors.loginColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationWidget(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
