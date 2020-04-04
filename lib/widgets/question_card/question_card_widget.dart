library question_card_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'question_card_mobile.dart';

class QuestionCardWidget extends StatelessWidget {
  final question;
  final onTap;
  final onMenuTap;
  final  menuItems;
  final bool hasMenu;

  const QuestionCardWidget({
    @required this.question,
    this.onTap,
    this.onMenuTap,
    this.menuItems,
    this.hasMenu,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _QuestionCardMobile(
        question: question,
        onTap: onTap,
        onMenuTap: onMenuTap,
        menuItems: menuItems,
        hasMenu: hasMenu,
      ),
    );
  }
}
