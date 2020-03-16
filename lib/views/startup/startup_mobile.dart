part of startup_view;

class _StartupMobile extends StatelessWidget {
  final StartupViewModel viewModel;

  _StartupMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 300, height: 100, child: LogoWidget()),
            CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
