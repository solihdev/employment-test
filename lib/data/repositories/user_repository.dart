import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_test/data/models/user_model.dart';
import 'package:employment_test/utils/my_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream<List<UserModel>> getUsers() =>
      _firestore.collection("users").snapshots().map(
            (event1) => event1.docs
                .map((doc) => UserModel.fromJson(doc.data()))
                .toList(),
          );

// Future<void> addUser({required UserModel userModel}) async {
//   try {
//     await _firestore.collection("users").add(userModel.toJson());
//     MyUtils.getMyToast(message: "User muvaffaqiyatli qo'shildi!");
//   } on FirebaseException catch (er) {
//     MyUtils.getMyToast(message: er.message.toString());
//   }
// }

// Future<void> updateUsersFCMToken(
//     {required String fcmToken, required String docId}) async {
//   try {
//     await _firestore.collection("users").doc(docId).update({
//       "fcm_token": fcmToken,
//     });
//   } on FirebaseException catch (er) {
//     MyUtils.getMyToast(message: er.message.toString());
//   }
// }
}
