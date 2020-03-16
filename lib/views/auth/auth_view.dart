library auth_view;

import 'package:nell/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:nell/widgets/logo/logo_widget.dart';
import 'package:nell/widgets/rounded_button/rounded_button_widget.dart';
import 'package:nell/widgets/rounded_text_box/rounded_text_box_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'auth_view_model.dart';

part 'auth_mobile.dart';
part 'auth_tablet.dart';
part 'auth_desktop.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = AuthViewModel();
    return ViewModelProvider<AuthViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AuthMobile(viewModel),
          desktop: _AuthDesktop(viewModel),
          tablet: _AuthTablet(viewModel),  
        );
      }
    );
  }
}