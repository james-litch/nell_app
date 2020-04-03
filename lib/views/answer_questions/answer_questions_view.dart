library answer_questions_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'answer_questions_view_model.dart';

part 'answer_questions_mobile.dart';


class AnswerQuestionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnswerQuestionsViewModel viewModel = AnswerQuestionsViewModel();
    return ViewModelProvider<AnswerQuestionsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AnswerQuestionsMobile(viewModel),
    
        );
      }
    );
  }
}