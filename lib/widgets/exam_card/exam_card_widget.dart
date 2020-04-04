library exam_card_widget;

import 'package:nell/core/models/exam_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'exam_card_mobile.dart';

class ExamCardWidget extends StatelessWidget {
  final Exam exam;
  final onTap;
  final onMenuTap;
  final  menuItems;
  final bool hasMenu;

  const ExamCardWidget({
    @required this.exam,
    this.onTap,
    this.onMenuTap,
    this.menuItems,
    @required this.hasMenu,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _ExamCardMobile(
        exam: exam,
        onTap: onTap,
        onMenuTap: onMenuTap,
        menuItems: menuItems,
        hasMenu: hasMenu,
      ),
    );
  }
}
