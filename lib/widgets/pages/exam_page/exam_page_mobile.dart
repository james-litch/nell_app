part of exam_page_widget;

class _ExamPageMobile extends StatelessWidget {
  final viewModel;

  const _ExamPageMobile({this.viewModel});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    void addExamsPanel() {
      viewModel.menuOpen = true;
      viewModel.showTabs = false;

      List editors = List.generate(
        2,
        (index) => TextEditingController(),
      );

      List questions = List();

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
            height: 670,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedTextBoxWidget(
                  controller: editors[0],
                  isPassword: false,
                  label: 'Exam Name',
                  primaryColor: Colors.white,
                  secondaryColor: Colors.blue,
                  boarder: false,
                ),
                SizedBox(height: 20),
                RoundedTextBoxWidget(
                  controller: editors[1],
                  isPassword: false,
                  label: 'Description',
                  primaryColor: Colors.white,
                  secondaryColor: Colors.blue,
                  boarder: false,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select questions to add:',
                    style:
                        theme.textTheme.headline3.copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.currentSubject.questions.length,
                    itemBuilder: (context, int index) {
                      return QuestionCardWidget(
                        onTapColor: Colors.red,
                        hasMenu: false,
                        question: viewModel.currentSubject.questions[index],
                        onTap: () {
                          var id = viewModel.currentSubject.questions[index].id;
                          questions.contains(id)
                              ? questions.remove(id)
                              : questions.add(id);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                RoundedButtonWidget(
                  text: 'Submit',
                  primaryColor: Colors.blue,
                  secondaryColor: Colors.white,
                  boarder: true,
                  function: () => viewModel.addExam(
                    name: editors[0].text,
                    description: editors[1].text,
                    questions: questions,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }

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
        children: <Widget>[
          SizedBox(height: 20),
          viewModel.currentSubject.isAdmin
              ? RoundedButtonWidget(
                  text: 'Add Exam',
                  primaryColor: Colors.blue,
                  secondaryColor: Colors.white,
                  boarder: false,
                  function: () => addExamsPanel(),
                )
              : Container(),
          Expanded(child: examCards)
        ],
      ),
    );
  }
}
