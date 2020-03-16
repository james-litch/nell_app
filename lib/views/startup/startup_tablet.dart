part of startup_view;

class _StartupTablet extends StatelessWidget {
  final StartupViewModel viewModel;

  _StartupTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StartupTablet')),
    );
  }
}