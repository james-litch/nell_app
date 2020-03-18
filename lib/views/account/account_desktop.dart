part of account_view;

class _AccountDesktop extends StatelessWidget {
  final AccountViewModel viewModel;

  _AccountDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AccountDesktop')),
    );
  }
}