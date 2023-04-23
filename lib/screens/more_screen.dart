import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../widget/category_widget.dart';
import '../widget/search_bar_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackBotton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => Categorywidget(index: index)),
      ),
    );
  }
}
