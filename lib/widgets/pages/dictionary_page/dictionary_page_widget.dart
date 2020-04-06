library dictionary_page_widget;

import 'package:nell/widgets/definition_card/definition_card_widget.dart';
import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:nell/widgets/shared/bottom_sheet/bottom_sheet_widget.dart';
import 'package:nell/widgets/shared/rounded_button/rounded_button_widget.dart';
import 'package:nell/widgets/shared/rounded_text_box/rounded_text_box_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'dictionary_page_mobile.dart';

class DictionaryPageWidget extends StatelessWidget {
  final viewModel;
  final scaffoldKey;

  const DictionaryPageWidget({this.viewModel, @required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _DictionaryPageMobile(
        viewModel: viewModel,
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}
