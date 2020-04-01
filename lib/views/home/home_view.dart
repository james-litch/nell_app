library home_view;

import 'package:nell/core/models/subject_model.dart';
import 'package:nell/widgets/base_page/base_page_widget.dart';
import 'package:nell/widgets/pages/dictionary_page/dictionary_page_widget.dart';
import 'package:nell/widgets/pages/exam_page/exam_page_widget.dart';
import 'package:nell/widgets/pages/feedback_page/feedback_page_widget.dart';
import 'package:nell/widgets/pages/home_page/home_page_widget.dart';
import 'package:nell/widgets/shared/bottom_sheet/bottom_sheet_widget.dart';

import 'package:nell/widgets/shared/spinner/spinner_widget.dart';
import 'package:nell/widgets/subject_menu_item/subject_menu_item_widget.dart';

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelProvider<HomeViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) async {
          await viewModel.init();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _HomeMobile(viewModel),
          );
        });
  }
}
