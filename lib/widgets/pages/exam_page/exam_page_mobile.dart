part of exam_page_widget;

class _ExamPageMobile extends StatelessWidget {
  final viewModel;

  const _ExamPageMobile({this.viewModel});
  @override
  Widget build(BuildContext context) {
    Widget examCards = viewModel.currentSubject == null
        ? Center(child: Text('no subject selected'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.exams.length,
            itemBuilder: (context, int index) {
              return ExamCardWidget(
                exam: viewModel.currentSubject.exams[index],
                onTap: () {},
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
