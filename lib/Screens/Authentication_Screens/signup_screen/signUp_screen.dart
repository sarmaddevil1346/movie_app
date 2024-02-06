import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/Screens/Authentication_Screens/login_screen/login_screen.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/utils/select_image.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/utils/textFieldContainer.dart';
import 'package:movie_app/constants/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextFieldSection _fieldSection = TextFieldSection();
  File? finalImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )),
                  const Spacer(),
                  const Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 32,
                        color: AppColors.whiteColor,
                        fontFamily: "Abril",
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 628,
                  width: 366,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      buildPicImageSection(context),
                      _fieldSection.buildTextFieldsSection(context)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPicImageSection(
    BuildContext context,
  ) {
    return Positioned(
      top: -60,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 150,
          child: InkWell(
            onTap: () => _onDialogueBox(
              context,
            ),
            child: finalImage != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(finalImage!),
                  )
                : CircleAvatar(
                    radius: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: -16,
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
                                  color: AppColors.loginColor,
                                  width: 4,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: AppColors.loginColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  imagePicker(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage == null) return;

    final tempImage = File(pickedImage.path); // Change this line
    setState(() {
      finalImage = tempImage; // Remove the type cast
    });
  }

  Future<void> _onDialogueBox(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick Image from Gallery"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  imagePicker(
                    ImageSource.gallery,
                  );
                  Navigator.pop(context);
                },
                title: const Text("Pick from Gallery"),
                leading: const Icon(Icons.photo_album_outlined),
              ),
              ListTile(
                onTap: () {
                  imagePicker(
                    ImageSource.camera,
                  );
                  Navigator.pop(context);
                },
                title: const Text("Pick from Camera"),
                leading: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
