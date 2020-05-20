part of home_page_widget;

class _HomePageMobile extends StatelessWidget {
  final viewModel;

  const _HomePageMobile({@required this.viewModel});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    void addQuestionPanel(int numOptions) {
      viewModel.menuOpen = true;
      viewModel.showTabs = false;

      List editors = List.generate(
        numOptions + 2,
        (index) => TextEditingController(),
      );

      Scaffold.of(context).showBottomSheet(
        (context) => BottomSheetWidget(
          primaryColor: Colors.blue,
          secondaryColor: Colors.white,
          sheetTop: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () {
                  viewModel.menuOpen = false;
                  Navigator.of(context).pop();
                  viewModel.showTabs = true;
                },
              ),
              Text(
                'Add Question',
                style: theme.textTheme.headline2,
              ),
            ],
          ),
          body: Container(
            height: 600,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RoundedTextBoxWidget(
                      controller: editors[0],
                      isPassword: false,
                      label: 'Question',
                      primaryColor: Colors.white,
                      secondaryColor: Colors.blue,
                      boarder: false,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: numOptions,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RoundedTextBoxWidget(
                          controller: editors[index + 1],
                          isPassword: false,
                          label: 'Option ${index + 1}',
                          primaryColor: Colors.white,
                          secondaryColor: Colors.blue,
                          boarder: false,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RoundedTextBoxWidget(
                          controller: editors.last,
                          isPassword: false,
                          label: 'Correct Option',
                          primaryColor: Colors.white,
                          secondaryColor: Colors.blue,
                          boarder: false,
                        ),
                      ),
                      SizedBox(width: 15),
                      RoundedButtonWidget(
                        text: 'Submit',
                        primaryColor: Colors.blue,
                        secondaryColor: Colors.white,
                        boarder: true,
                        function: () {
                          List inputs = List.generate(
                            numOptions + 2,
                            (index) => editors[index].text,
                          );
                          viewModel.addQuestion(inputs);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget addQuestionButton = viewModel.currentSubject.isAdmin
        ? PopupMenuButton(
            onSelected: (value) => addQuestionPanel(value),
            icon: Icon(Icons.add, color: Colors.blue, size: 28),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  '2 Options',
                  style: theme.textTheme.bodyText2,
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text(
                  '3 Options',
                  style: theme.textTheme.bodyText2,
                ),
              ),
              PopupMenuItem<int>(
                value: 4,
                child: Text(
                  '4 Options',
                  style: theme.textTheme.bodyText2,
                ),
              ),
              PopupMenuItem<int>(
                value: 5,
                child: Text(
                  '5 Options',
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ],
          )
        : Container();

    Widget currentQuestions = viewModel.currentSubject == null ||
            viewModel.currentSubject.currentQuestions.length == 0
        ? Center(child: Text('no current questions'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.currentQuestions.length,
            itemBuilder: (context, int index) {
              return QuestionCardWidget(
                onTapColor: Colors.blue,
                question: viewModel.currentSubject.currentQuestions[index],
                onTap: () => viewModel.onQuestionClick(
                    viewModel.currentSubject.questions[index].id),
                hasMenu: viewModel.currentSubject.isAdmin,
                onMenuTap: (value) => viewModel.editResources(value, index),
                menuItems: [
                  PopupMenuItem<String>(
                    value: 'REMOVE_CURRENT_QUESTION',
                    child: Text(
                      'remove',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ],
              );
            },
          );

    Widget questionsList = viewModel.currentSubject == null ||
            viewModel.currentSubject.questions.length == 0
        ? Center(child: Text('no questions'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.questions.length,
            itemBuilder: (context, int index) {
              return QuestionCardWidget(
                onTapColor: Colors.blue,
                question: viewModel.currentSubject.questions[index],
                onTap: () => viewModel.onQuestionClick(
                    viewModel.currentSubject.questions[index].id),
                hasMenu: viewModel.currentSubject.isAdmin,
                onMenuTap: (value) => viewModel.editResources(value, index),
                menuItems: [
                  PopupMenuItem<String>(
                    value: 'DELETE_QUESTION',
                    child: Text(
                      'delete',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'MAKE_QUESTION_CURRENT',
                    child: Text(
                      'make current',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ],
              );
            },
          );

    Widget content = viewModel.currentSubject.isAdmin
        ? BasePageWidget(
            pageName: 'Home',
            content: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Current Questions',
                      style: theme.textTheme.headline3),
                ),
                Expanded(child: currentQuestions),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Questions', style: theme.textTheme.headline3),
                    viewModel.currentSubject.isAdmin
                        ? addQuestionButton
                        : Container(),
                  ],
                ),
                Expanded(child: questionsList),
                SizedBox(height: 20),
                // deleteSubjectButton,
              ],
            ))
        : BasePageWidget(
            pageName: 'Home',
            content: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Current Questions',
                      style: theme.textTheme.headline3),
                ),
                Expanded(child: currentQuestions),
              ],
            ),
          );
    return content;
  }
}
