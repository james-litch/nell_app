library account_view;

import 'package:nell/widgets/rounded_button/rounded_button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'account_view_model.dart';

part 'account_mobile.dart';
part 'account_tablet.dart';
part 'account_desktop.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountViewModel viewModel = AccountViewModel();
    return ViewModelProvider<AccountViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _AccountMobile(viewModel),
          );
        });
  }
}
