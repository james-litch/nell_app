library exam_page_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'exam_page_mobile.dart';
part 'exam_page_tablet.dart';
part 'exam_page_desktop.dart';

class ExamPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _ExamPageMobile(),
        desktop: _ExamPageDesktop(),
        tablet: _ExamPageTablet(),
    );
  }
}