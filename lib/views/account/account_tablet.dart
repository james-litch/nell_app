part of account_view;

class _AccountTablet extends StatelessWidget {
  final AccountViewModel viewModel;

  _AccountTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AccountTablet')),
    );
  }
}