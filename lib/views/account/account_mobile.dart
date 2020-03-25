part of account_view;

class _AccountMobile extends StatelessWidget {
  final AccountViewModel viewModel;

  _AccountMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Widget logoutButton = RoundedButtonWidget(
      text: 'LOGOUT',
      primaryColor: Colors.blue,
      secondaryColor: Colors.white,
      boarder: false,
      function: () => viewModel.logout(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[logoutButton],
        ),
      ),
    );
  }
}
