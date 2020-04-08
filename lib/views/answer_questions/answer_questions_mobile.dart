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
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ...viewModel.answers.map(
            (element) => RadioListTile(
              title: Text(
                '${element.answer}',
                style: theme.textTheme.bodyText1.copyWith(fontSize: 20),
              ),
              value: viewModel.answers.indexOf(element),
              groupValue: viewModel.chosenAnswer,
              onChanged: (value) => viewModel.answer = value,
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
      function: () => viewModel.answerQuestion(),
    );

    Widget questionPage = Stack(
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
              SizedBox(height: 50),
              Align(alignment: Alignment.center, child: answers),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: actionButton,
                ),
              )
            ],
          ),
        )
      ],
    );

    Widget examResults = BasePageWidget(
      pageName: 'Check Answers',
      content: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.questions.length,
            itemBuilder: (context, int index) {
              var question = viewModel.questions[index];
              var chosenAnswer = viewModel.chosenAnswers[index];
              return Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: chosenAnswer == question.correctAnswer
                        ? Colors.green
                        : Colors.red,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${question.question}',
                          style: theme.textTheme.headline3),
                      SizedBox(height: 10),
                      Text(
                        '${question.answers[chosenAnswer].answer}',
                        style: theme.textTheme.bodyText1.copyWith(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                          'Answer:    ${question.answers[question.correctAnswer].answer}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );

    Widget questionResults = BasePageWidget(
      pageName: '${viewModel.questions[0].question}',
      content: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Answers:',
              style: theme.textTheme.headline3,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.questions[0].answers.length,
            itemBuilder: (context, int index) {
              var answers = viewModel.questions[0].answers;
              var correctAnswerIndex = viewModel.questions[0].correctAnswer;
              return Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color:
                        correctAnswerIndex == index ? Colors.green : Colors.red,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${answers[index].answer}',
                          style:
                              theme.textTheme.bodyText1.copyWith(fontSize: 18),
                        ),
                      ),
                      Text(
                        '${answers[index].totalChosen}',
                        style: theme.textTheme.bodyText1.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          RoundedButtonWidget(
            text: 'Done',
            primaryColor: Colors.blue,
            secondaryColor: Colors.white,
            boarder: false,
            function: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );

    Widget resultsPage = viewModel.isExam ? examResults : questionResults;
    return Scaffold(
      appBar: AppBar(
        title: Text('${viewModel.type}'),
        elevation: 0,
      ),
      body: viewModel.isFinished ? resultsPage : questionPage,
    );
  }
}
