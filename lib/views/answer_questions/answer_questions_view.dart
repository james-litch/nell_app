library answer_questions_view;

import 'package:nell/core/models/question_model.dart';
import 'package:nell/widgets/shared/base_page/base_page_widget.dart';
import 'package:nell/widgets/shared/rounded_button/rounded_button_widget.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'answer_questions_view_model.dart';

part 'answer_questions_mobile.dart';

class AnswerQuestionsView extends StatelessWidget {
  final List<Question> questions;
  final String subjectId;

  AnswerQuestionsView({this.questions, this.subjectId});
  @override
  Widget build(BuildContext context) {
    AnswerQuestionsViewModel viewModel = AnswerQuestionsViewModel(
      questions: questions,
      subjectId: subjectId,
    );
    return ViewModelProvider<AnswerQuestionsViewModel>.withConsumer(
        viewModel: viewModel,
        onModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _AnswerQuestionsMobile(viewModel),
          );
        });
  }
}
