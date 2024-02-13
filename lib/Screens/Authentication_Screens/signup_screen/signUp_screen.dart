import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/Screens/Authentication_Screens/signup_screen/utils/password_fiield.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/constants/colors.dart';
import '../../../Utils/alert_dialogue.dart';
import '../../../Utils/button.dart';
import '../../../Utils/text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

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
                        Navigator.pushReplacementNamed(
                            context, RoutesNames.loginScreen);
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          const Text(
                            "Full Name  ",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldsWidget(
                            text: 'Jane Cooper',
                            outlineInputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 3),
                            ),
                            style: const TextStyle(color: Colors.white38),
                            controller: _nameController,
                          ),
                          const Text(
                            "Email address",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldsWidget(
                            text: 'janecooper@gmail.com',
                            outlineInputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 3),
                            ),
                            style: const TextStyle(color: Colors.white38),
                            controller: _emailController,
                          ),
                          const Text(
                            "Choose a password",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextFieldsWidget(
                            text: "***************",
                            outlineInputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 3),
                            ),
                            controller: _passwordController,
                          ),
                          const Text(
                            "Confirm password",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswordTextFieldsWidget(
                            text: "***************",
                            outlineInputBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 3),
                            ),
                            controller: _confirmPasswordController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ButtonWidget(
                            text: "Sign Up",
                            style: const TextStyle(
                              color: AppColors.loginColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                            onTap: () {
                              signUp(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _confirmPasswordController.text,
                              );
                            },
                          )
                        ],
                      ),
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
                      Navigator.pushNamed(context, RoutesNames.loginScreen);
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

  Future<void> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Center(
          child: SpinKitCircle(
            size: 50,
            color: AppColors.loginColor,
          ), // Loading indicator
        );
      },
    );

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        finalImage == null) {
      Navigator.pop(context); // Dismiss the loading dialog
      UtilsHelper.customAlertDialogue(context, 'Fill all the data');
      return;
    }

    if (password != confirmPassword) {
      Navigator.pop(context); // Dismiss the loading dialog
      UtilsHelper.customAlertDialogue(
          context, 'Password and Confirm Password do not match');
      return;
    }

    if (password.length < 6) {
      Navigator.pop(context);
      UtilsHelper.customAlertDialogue(
          context, 'Password must be at least 6 characters long');
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addData(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        userCredential.user!.uid,
      );

      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, RoutesNames.navScreen);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      UtilsHelper.customAlertDialogue(context, e.code.toString());
    }
  }

  addData(String name, String email, String password, var id) async {
    try {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref("profile_image")
          .child("imageID")
          .putFile(finalImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      final url = await taskSnapshot.ref.getDownloadURL();

      DocumentReference documentReference =
          FirebaseFirestore.instance.collection("Users").doc(id);

      await documentReference.set({
        "Email": email,
        "Name": name,
        "userId": id,
        "Password": password,
        "url": url,
      });
    } on FirebaseAuthException catch (e) {
      UtilsHelper.customAlertDialogue(context, e.code.toString());
    }
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
