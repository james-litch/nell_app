library users_page_widget;

import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:nell/widgets/user_card/user_card_widget.dart';
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
