library feedback_page_widget;

import 'package:nell/widgets/feedback_card/feedback_card_widget.dart';
import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:nell/widgets/shared/rounded_button/rounded_button_widget.dart';
import 'package:nell/widgets/shared/rounded_text_box/rounded_text_box_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'feedback_page_mobile.dart';

class FeedbackPageWidget extends StatelessWidget {
  final viewModel;

  const FeedbackPageWidget({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _FeedbackPageMobile(viewModel: viewModel,),
    );
  }
}
