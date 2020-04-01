library users_page_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'users_page_mobile.dart';

class UsersPageWidget extends StatelessWidget {
  final viewModel;

  const UsersPageWidget({@required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _UsersPageMobile(viewModel: viewModel),
    );
  }
}
