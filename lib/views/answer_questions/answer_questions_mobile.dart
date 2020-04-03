part of answer_questions_view;

class _AnswerQuestionsMobile extends StatelessWidget {
  final AnswerQuestionsViewModel viewModel;

  _AnswerQuestionsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AnswerQuestionsMobile')),
    );
  }
}