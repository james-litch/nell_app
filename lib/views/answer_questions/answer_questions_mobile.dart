part of answer_questions_view;

class _AnswerQuestionsMobile extends StatelessWidget {
  final AnswerQuestionsViewModel viewModel;

  _AnswerQuestionsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget questionNumber = CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(
        '${viewModel.questionNumber}',
        style: theme.textTheme.bodyText2,
      ),
    );

    Widget questionText = Expanded(
      child: Text(
        "${viewModel.question}",
        softWrap: true,
        style: theme.textTheme.headline2.copyWith(color: Colors.white),
      ),
    );

    Widget answers = Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ...viewModel.answers.map(
            (element) => RadioListTile(
              title: Text(
                '${element.answer}',
                style: theme.textTheme.bodyText1,
              ),
              value: viewModel.answers.indexOf(element),
              groupValue: viewModel.chosenAnswer,
              onChanged: (value)=> viewModel.answerQuestion = value,
            ),
          )
        ],
      ),
    );

    Widget actionButton = RoundedButtonWidget(
      text: viewModel.buttonText,
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () {},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Question'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  questionNumber,
                  SizedBox(width: 20),
                  questionText
                ]),
                SizedBox(height: 20),
                answers,
                Expanded(
                    child:
                        Align(alignment: Alignment.center, child: actionButton))
              ],
            ),
          )
        ],
      ),
    );
  }
}
