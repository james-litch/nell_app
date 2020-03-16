part of auth_view;

class _AuthDesktop extends StatelessWidget {
  final AuthViewModel viewModel;

  _AuthDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AuthDesktop')),
    );
  }
}