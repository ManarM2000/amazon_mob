import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../model/review_model.dart';
import '../providers/user_details_provider.dart';
import '../resources/cloudfirestore.dart';
import '../utils/colors_themes.dart';
import '../utils/constant.dart';
import '../utils/utils.dart';
import '../widget/cost_widget.dart';
import '../widget/custom_main_botton.dart';
import '../widget/custon_simple_rounded_button.dart';
import '../widget/rating_stars_widget.dart';
import '../widget/review_dialog.dart';
import '../widget/review_widget.dart';
import '../widget/search_bar_widget.dart';
import '../widget/user_details_bar.dart';

class ProductScreenState extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreenState({super.key, required this.productModel});

  @override
  State<ProductScreenState> createState() => _ProductScreenStateState();
}

class _ProductScreenStateState extends State<ProductScreenState> {
  @override
  Widget build(BuildContext context) {
    SizedBox spaceThingy = const SizedBox(
      height: 15,
    );
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackBotton: true),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              widget.productModel.sellerName,
                              style: const TextStyle(
                                  color: activeCyancolor, fontSize: 16),
                            ),
                          ),
                          Text(widget.productModel.productName)
                        ],
                      ),
                      RatingStarwidget(rating: widget.productModel.rating),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15),
                //   child: Container(
                //     height: screenSize.height / 3,
                //     child: FittedBox(
                //         child: Image.network(widget.productModel.url)),
                //   ),
                // ),
                SizedBox(
                  height: screenSize.height / 3,
                  child: SizedBox.expand(
                      child: FittedBox(
                          child: Image.network(widget.productModel.url))),
                ),
                spaceThingy,
                CostWiddddddget(
                    color: Colors.black,
                    cost: widget.productModel.cost),
                spaceThingy,
                CustomMainBotton(
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () async {
                      await CloudFirestoreClass().addProductToOrder(
                          model: widget.productModel,
                          userDetails: Provider.of<UserDetailsProvider>(context,
                                  listen: false)
                              .userDetails);
                      Utils().showSnackBar(context: context, content: "Done");
                    },
                    child: const Text("Buy Now",
                        style: TextStyle(color: Colors.black))),
                spaceThingy,
                CustomMainBotton(
                    color: Colors.yellow,
                    isLoading: false,
                    onPressed: () async {
                      //product model to data base
                      await CloudFirestoreClass()
                          .addProductTocart(productModel: widget.productModel);
                      Utils().showSnackBar(
                          context: context, content: "Added to cart");
                    },
                    child: const Text("Add to cart",
                        style: TextStyle(color: Colors.black))),
                spaceThingy,
                CustonSimpleButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => ReviewDialog(
                                productUid: widget.productModel.uid,
                              ));
                    },
                    text: "Add to review for this product"),
                SizedBox(
                  height: screenSize.height,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .doc(widget.productModel.uid)
                          .collection("reviews")
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                ReviewModel model =
                                    ReviewModel.getModelFromJson(
                                        json:
                                            snapshot.data!.docs[index].data());
                                return ReviewWidget(review: model);
                              });
                        }
                      }),
                ),
              ],
            ),
          )),
          const UserDetailsBar(
            offset: 0,
          ),
        ],
      ),
    ));
  }
}
