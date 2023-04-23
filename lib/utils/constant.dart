import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../screens/acount_screens.dart';
import '../screens/cart_screens.dart';
import '../screens/home_screen.dart';
import '../screens/more_screen.dart';
import '../widget/simple_product_widget.dart';

const double kAppBarHeight = 80;

const String amazonLogoUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png";

const List<String> categoriesList = [
  "Prime",
  "Mobiles",
  "Fashion",
  "Electronics",
  "Home",
  "Fresh",
  "Appliances",
  "Books, Toys",
  "Essential"
];

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];

const List<String> largeAds = [
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
  "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
];

const List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = [
  "Amazon Pay",
  "Recharge ",
  "Rewards",
  "Pay Bills"
];

//Dont even attemp to scroll to the end of this manually lmao
const String amazonLogo =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";

List<Widget> testChildren = [
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "sajid_bhuru",
        cost: 9744646,
        discount: 0,
        uid: "sachin",
        sellerName: "kavita",
        sellerUid: "15ca16",
        rating: 1,
        noOfRating: 5),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "sajid_bhuru",
        cost: 9744646,
        discount: 0,
        uid: "sachin",
        sellerName: "kavita",
        sellerUid: "15ca16",
        rating: 1,
        noOfRating: 5),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "sajid_bhuru",
        cost: 9744646,
        discount: 0,
        uid: "sachin",
        sellerName: "kavita",
        sellerUid: "15ca16",
        rating: 0,
        noOfRating: 5),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "sajid_bhuru",
        cost: 9744646,
        discount: 0,
        uid: "sachin",
        sellerName: "kavita",
        sellerUid: "15ca16",
        rating: 1,
        noOfRating: 5),
  ),
  SimpleProductWidget(
    productModel: ProductModel(
        url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        productName: "sajid_bhuru",
        cost: 9744646,
        discount: 0,
        uid: "sachin",
        sellerName: "kavita",
        sellerUid: "15ca16",
        rating: 1,
        noOfRating: 5),
  ),

  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg"),
  // const SimpleProductWidget(
  //     url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
];
List<String> keyOfRating = ["Very bad", "Poor", "Average", "Good", "Excellent"];
