library exam_page_widget;

import 'package:nell/widgets/exam_card/exam_card_widget.dart';
import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'exam_page_mobile.dart';

class ExamPageWidget extends StatelessWidget {
  final viewModel;

  const ExamPageWidget({this.viewModel});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _ExamPageMobile(viewModel: viewModel),
    );
  }
}
