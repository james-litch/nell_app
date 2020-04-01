library feedback_card_widget;

import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'feedback_card_mobile.dart';


class FeedbackCardWidget extends StatelessWidget {
  final String message;

  const FeedbackCardWidget({@required this.message}) ;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: _FeedbackCardMobile(message: message),
      
    );
  }
}