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
                onTap: () {},
              );
            },
          );

    Widget questionsList = viewModel.currentSubject == null ||
            viewModel.currentSubject.currentQuestions.length == 0
        ? Center(child: Text('no questions'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.currentQuestions.length,
            itemBuilder: (context, int index) {
              return QuestionCardWidget(
                question: viewModel.currentSubject.currentQuestions[index],
                onTap: () {},
              );
            },
          );

    return BasePageWidget(
        pageName: 'Home',
        content: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Current Questions', style: theme.textTheme.headline3),
            ),
            Expanded(child: currentQuestions),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Questions', style: theme.textTheme.headline3),
            ),
            Expanded(child: questionsList),
          ],
        ));
  }
}
