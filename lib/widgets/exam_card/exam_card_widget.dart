library exam_card_widget;

import 'package:nell/core/models/subject_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'exam_card_mobile.dart';

class ExamCardWidget extends StatelessWidget {
  final Exam exam;
  final onTap;

  const ExamCardWidget({@required this.exam, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _ExamCardMobile(
        exam: exam,
        onTap: onTap,
      ),
    );
  }
}
