part of account_view;

class _AccountMobile extends StatelessWidget {
  final AccountViewModel viewModel;

  _AccountMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoundedButtonWidget(
              text: 'LOGOUT',
              primaryColor: Colors.blue,
              secondaryColor: Colors.white,
              boarder: false,
              function: ()=>viewModel.logout(),
            ),
          ],
        ),
      ),
    );
  }
}
