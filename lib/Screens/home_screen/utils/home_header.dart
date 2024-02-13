import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/Screens/home_screen/utils/bottomsheet.dart';
import 'package:movie_app/Utils/routes/routes_names.dart';
import '../../../Utils/text.dart';
import '../../../constants/colors.dart';

class HomeHeaderUtilities {
  final BottomSheetSection _bottomSheetSection = BottomSheetSection();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Widget buildHeaderRow(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _firestore.collection("Users").doc(userId).snapshots(),
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
            child: Text("Something went wrong"),
          );
        }

        final userData = snapshot.data!.data() as Map<String, dynamic>?;

        final profileImageUrl = userData?["url"] as String?;

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, RoutesNames.profileScreen);
              },
              child: profileImageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: profileImageUrl,
                      placeholder: (context, url) => SpinKitCircle(
                        size: 50,
                        color: AppColors.loginColor,
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: imageProvider,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person),
                    ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextDecoration(
                  text: 'Good Morning',
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  textSize: 20,
                  maxLines: 1,
                ),
                DefaultTextDecoration(
                  text: userData?["Name"] ?? '',
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.w300,
                  textSize: 16,
                  maxLines: 2,
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                _bottomSheetSection.displayBottomSheet(context);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Image.asset("assets/images/premium.png"),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
