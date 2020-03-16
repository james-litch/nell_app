part of startup_view;

class _StartupDesktop extends StatelessWidget {
  final StartupViewModel viewModel;

  _StartupDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StartupDesktop')),
    );
  }
}