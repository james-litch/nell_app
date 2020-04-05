part of exam_page_widget;

class _ExamPageMobile extends StatelessWidget {
  final viewModel;

  const _ExamPageMobile({this.viewModel});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget examCards = viewModel.currentSubject == null ||
    viewModel.currentSubject.exams.length == 0
        ? Center(child: Text('no exams available'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.exams.length,
            itemBuilder: (context, int index) {
              return ExamCardWidget(
                exam: viewModel.currentSubject.exams[index],
                onTap: () {},
                hasMenu: viewModel.currentSubject.isAdmin,
                onMenuTap: (value) => viewModel.editResources(value, index),
                menuItems: [
                  PopupMenuItem<String>(
                    value: 'DELETE_EXAM',
                    child: Text(
                      'delete',
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ],
              );
            });

    return BasePageWidget(
      pageName: 'Exams',
      content: Column(
        children: <Widget>[SizedBox(height: 20), Expanded(child: examCards)],
      ),
    );
  }
}
