import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_details.dart';
import 'cloudfirestore.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await cloudFirestoreClass.uploadNameAndAddressToDatabase(user: user);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
      //fucntion
    } else {
      output = "Please fill up everything";
    }
    return output;
  }

  Future<String> signInUser({required email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
      //fucntion
    } else {
      output = "Please fill up everything";
    }
    return output;
  }
}
