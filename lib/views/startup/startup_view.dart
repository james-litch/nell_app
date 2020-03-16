library startup_view;

import 'package:nell/widgets/logo/logo_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'startup_view_model.dart';

part 'startup_mobile.dart';
part 'startup_tablet.dart';
part 'startup_desktop.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StartupViewModel viewModel = StartupViewModel();
    return ViewModelProvider<StartupViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          viewModel.startUpLogic();
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _StartupMobile(viewModel),
            desktop: _StartupDesktop(viewModel),
            tablet: _StartupTablet(viewModel),
          );
        });
  }
}
