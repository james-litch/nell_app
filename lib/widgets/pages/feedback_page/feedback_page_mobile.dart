part of feedback_page_widget;

class _FeedbackPageMobile extends StatelessWidget {
  final viewModel;

  const _FeedbackPageMobile({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackText = TextEditingController();

    Widget feedbackMessages = viewModel.currentSubject == null
        ? Center(child: Text('no subject selected'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.feedback.length,
            itemBuilder: (context, int index) {
              return FeedbackCardWidget(
                  message: viewModel.currentSubject.feedback[index]);
            });

    Widget feedbackSendButton = RoundedButtonWidget(
      text: 'Send',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () => viewModel.sendFeedback(feedbackText.text),
    );

    Widget feedbackTextBox = RoundedTextBoxWidget(
      controller: feedbackText,
      isPassword: false,
      label: 'feedback',
      primaryColor: Colors.white,
      secondaryColor: Colors.blue,
      boarder: true,
    );

    return BasePageWidget(
        pageName: 'Feedback',
        content: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(child: feedbackMessages),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: feedbackTextBox),
                SizedBox(width: 10),
                feedbackSendButton,
              ],
            )
          ],
        ));
  }
}
