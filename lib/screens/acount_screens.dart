import 'package:amazon_project/screens/sell_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/order_request.dart';
import '../model/product_model.dart';
import '../model/user_details.dart';
import '../providers/user_details_provider.dart';
import '../utils/colors_themes.dart';
import '../utils/constant.dart';
import '../utils/utils.dart';
import '../widget/account_screen_app_bar.dart';
import '../widget/custom_main_botton.dart';
import '../widget/product_showcase_list_view.dart';
import '../widget/simple_product_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // List<Widget>? yourOrders;

  @override
  Widget build(BuildContext context) {
    Size screeSize = Utils().getScreenSize();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screeSize.height,
            width: screeSize.width,
            child: Column(
              children: [
                const IntroductionWidgetAccounScreen(),
                CustomMainBotton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    }),
                CustomMainBotton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Sell",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.yellow,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SellScreen()));
                    }),
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection("orders")
                        .get(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      } else {
                        List<Widget> children = [];
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          ProductModel model = ProductModel.getModelFromJson(
                              json: snapshot.data!.docs[i].data());
                          children
                              .add(SimpleProductWidget(productModel: model));
                        }
                        return ProductShowcaseListView(
                            title: "Your oders", children: children);
                      }
                    }),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Request",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("orderRequest")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            OrderRequestModel model =
                                OrderRequestModel.getModelFromJson(
                                    json: snapshot.data!.docs[index].data());
                            return ListTile(
                              title: Text(
                                "Order: ${model.orderName}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text("Address: ${model.buyersAddress}"),
                              trailing: IconButton(
                                  onPressed: () async {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection("orderRequest")
                                        .doc(snapshot.data!.docs[index].id)
                                        .delete();
                                  },
                                  icon: const Icon(Icons.check)),
                            );
                          });
                    }
                  },
                ))
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccounScreen extends StatelessWidget {
  const IntroductionWidgetAccounScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    return Container(
      height: kAppBarHeight / 2,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.000000000001)],
              // colors: backgroundGradient,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hello,",
                    style: TextStyle(color: Colors.grey[800], fontSize: 26)),
                TextSpan(
                    text: " ${userDetailsModel.name}",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold))
              ])),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),

            )
          ],
        ),
      ),
    );
  }
}
// ListView.builder(
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             OrderRequestModel model =
//                                 OrderRequestModel.getModelFromJson(
//                                     json: snapshot.data!.docs[index].data());
//                             return ListTile(
//                               title: Text(
//                                 "Order: ${model.orderName}",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               subtitle: Text("Address: ${model.buyersAddress}"),
//                               trailing: IconButton(
//                                   onPressed: () async {
//                                     FirebaseFirestore.instance
//                                         .collection("users")
//                                         .doc(FirebaseAuth
//                                             .instance.currentUser!.uid)
//                                         .collection("orderRequests")
//                                         .doc(snapshot.data!.docs[index].id)
//                                         .delete();
//                                   },
//                                   icon: const Icon(Icons.check)),
//                             );
//                           });