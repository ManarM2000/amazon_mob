import 'package:flutter/material.dart';

import '../screens/search_screen.dart';
import '../utils/colors_themes.dart';
import '../utils/constant.dart';

class AccountScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const AccountScreenAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    // Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Container(
        height: kAppBarHeight,
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                colors: backgroundGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.network(amazonLogoUrl, height: kAppBarHeight * 0.8),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
