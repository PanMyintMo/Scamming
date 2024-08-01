
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:student_registration/screens/home/bodyutil.dart';
import 'package:student_registration/util/scroll_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
      itemScrollController: scrollProvider.itemScrollController,
    );
  }
}
