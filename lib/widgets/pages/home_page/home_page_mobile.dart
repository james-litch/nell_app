part of home_page_widget;

class _HomePageMobile extends StatelessWidget {
  final viewModel;

  const _HomePageMobile({@required this.viewModel});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget currentQuestions = viewModel.currentSubject == null ||
            viewModel.currentSubject.currentQuestions.length == 0
        ? Center(child: Text('no current questions'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.currentQuestions.length,
            itemBuilder: (context, int index) {
              return QuestionCardWidget(
                question: viewModel.currentSubject.currentQuestions[index],
                onTap: () => viewModel.onQuestionClick(
                    viewModel.currentSubject.questions[index].id),
                hasMenu: viewModel.currentSubject.isAdmin,
                onMenuTap: (value) => viewModel.questionMenu(value, index),
                menuItems: [
                  PopupMenuItem<String>(
                    value: 'REMOVE',
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
                question: viewModel.currentSubject.questions[index],
                onTap: () => viewModel.onQuestionClick(
                    viewModel.currentSubject.questions[index].id),
                hasMenu: viewModel.currentSubject.isAdmin,
                onMenuTap: (value) => viewModel.questionMenu(value, index),
                menuItems: [
                  PopupMenuItem<String>(
                    value: 'DELETE',
                    child: Text(
                      'delete',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'MAKE_CURRENT',
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Questions', style: theme.textTheme.headline3),
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
