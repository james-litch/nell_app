library home_page_widget;

import 'package:nell/widgets/question_card/question_card_widget.dart';
import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'home_page_mobile.dart';

class HomePageWidget extends StatelessWidget {
  final viewModel;

  const HomePageWidget({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _HomePageMobile(viewModel: viewModel),
    );
  }
}
