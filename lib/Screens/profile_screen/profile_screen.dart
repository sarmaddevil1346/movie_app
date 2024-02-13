import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import 'package:movie_app/Utils/text.dart';
import 'package:movie_app/Utils/text_form_field.dart';
import 'package:movie_app/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _pickedImage;
  String? _imageUrl;
  bool _isLoading = false;
  var fireStore = FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTextDecoration(
                    text: "Profile",
                    textColor: AppColors.loginColor,
                    fontWeight: FontWeight.w700,
                    textSize: 40,
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      var user = FirebaseAuth.instance.currentUser;
                      Navigator.pushReplacementNamed(
                          context, RoutesNames.loginScreen);
                    },
                    child: Container(
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                          gradient: AppColors.linearGradient,
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: DefaultTextDecoration(
                          text: "Logout",
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          textSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: fireStore,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitCircle(
                            size: 50,
                            color: AppColors.loginColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Something went wrong",
                          ),
                        );
                      }

                      final userData =
                          snapshot.data!.data() as Map<String, dynamic>?;
                      final profileImageUrl = userData?["url"] as String?;

                      if (profileImageUrl == null) {
                        // Handle case where "url" field is missing
                        return InkWell(
                          onTap: () {
                            _onDialogueBox(context);
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.person),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            _onDialogueBox(context);
                          },
                          child: CachedNetworkImage(
                            imageUrl: profileImageUrl,
                            placeholder: (context, url) {
                              return SpinKitCircle(
                                size: 50,
                                color: AppColors.loginColor,
                              );
                            },
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: imageProvider,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              StreamBuilder(
                stream: fireStore,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: const Text(
                        "Something went wrong",
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: AppColors.loginColor,
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: AppColors.loginColor,
                      ),
                    );
                  } else {
                    var userData = snapshot.data!;
                    final String namePath = userData["Name"];
                    final String emailPath = userData["Email"];
                    final String passwordPath = userData["Password"];
                    return Expanded(
                      child: ListView(
                        children: [
                          buildListTile(
                            "User Name",
                            namePath.toString(),
                            onTap: () {
                              showUserNameDialogue(
                                context,
                                namePath.toString(),
                              );
                            },
                            image: Image.asset(
                                height: 20,
                                width: 20,
                                "assets/images/pencil.png"),
                          ),
                          const Divider(
                            color: AppColors.whiteColor,
                            endIndent: 5,
                            indent: 5,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          buildListTile(
                            "Email",
                            emailPath,
                          ),
                          const Divider(
                            color: AppColors.whiteColor,
                            endIndent: 5,
                            indent: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 13,
                              right: 25.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultTextDecoration(
                                  text: "Password",
                                  textColor: AppColors.whiteColor,
                                  fontWeight: FontWeight.w700,
                                  textSize: 16,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      filled: false, border: InputBorder.none),
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  initialValue: passwordPath,
                                  readOnly: true,
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
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
                    );
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(String title, String subtitle,
      {VoidCallback? onTap, String? urlImage, Image? image}) {
    return ListTile(
      title: DefaultTextDecoration(
        text: title,
        textColor: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        textSize: 18,
      ),
      subtitle: DefaultTextDecoration(
        text: subtitle,
        textColor: AppColors.whiteColor,
        fontWeight: FontWeight.w300,
        textSize: 16,
      ),
      trailing: InkWell(
        onTap: onTap,
        child: Container(height: 20, width: 20, child: image),
      ),
    );
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
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                title: const Text("Pick from Gallery"),
                leading: const Icon(Icons.photo_album_outlined),
              ),
              ListTile(
                onTap: () {
                  _pickImage(ImageSource.camera);

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

  Future<void> showUserNameDialogue(BuildContext context, String name) {
    final TextEditingController controller = TextEditingController();
    final nameFocusNode = FocusNode();
    controller.text = name;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.profileBackgroundColor,
          title: const Text(
            "Enter User Name",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFieldsWidget(
                text: 'Jane Cooper',
                focusNode: nameFocusNode,
                outlineInputBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 255, 255, 1.0), width: 3),
                ),
                style: const TextStyle(color: Colors.black),
                controller: controller,
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                leading: const Icon(Icons.cancel),
              ),
              ListTile(
                onTap: () async {
                  await updateName(controller.text.toString());
                  Navigator.pop(context);
                },
                title: const Text(
                  "Update",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                leading: const Icon(Icons.check),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> updateName(String newName) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"Name": newName}).then((value) {
        print("Success!");
      }).onError((error, stackTrace) {
        print(error.toString());
      });
      print('Name updated successfully');
    } catch (e) {
      print('Error updating name: $e');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImageFile = await ImagePicker().pickImage(source: source);

    if (pickedImageFile == null) {
      return;
    }

    final pickedImage = File(pickedImageFile.path);

    setState(() {
      _pickedImage = pickedImage;
    });

    await _updateImageInFirestore(_pickedImage!);
  }

  Future<void> _updateImageInFirestore(File imageFile) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitCircle(
                    color: AppColors.loginColor,
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Text("Uploading image..."),
                ],
              ),
            ),
          );
        },
      );

      final docSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      final existingImageUrl = docSnapshot['url'];

      print('Existing image URL: $existingImageUrl');
      await FirebaseStorage.instance.refFromURL(existingImageUrl).delete();
      final ref = FirebaseStorage.instance
          .ref()
          .child('Images')
          .child('${DateTime.now()}.jpg');

      final uploadTask = ref.putFile(imageFile);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print(
            'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      }, onError: (error) {
        print('Upload error: $error');
        Navigator.pop(context); // Close progress dialog on error
      });

      final TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => null);
      final imageUrl = await taskSnapshot.ref.getDownloadURL();
      print('Uploaded image URL: $imageUrl');

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'url': imageUrl,
      });

      Navigator.pop(context); // Close progress dialog

      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (error) {
      print('Error updating image: $error');
      Navigator.pop(context); // Close progress dialog
    }
  }
}
