import 'package:flutter/material.dart';

import '../model/user_details.dart';
import '../resources/cloudfirestore.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;
  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", address: "Loading");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
