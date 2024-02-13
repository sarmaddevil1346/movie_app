import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fief {
  static var fireStore = FirebaseFirestore.instance
      .collection("Users")
      .where('Name', isEqualTo: FirebaseAuth.instance.currentUser!.displayName)
      .snapshots();
}
