part of auth_view;

class _AuthTablet extends StatelessWidget {
  final AuthViewModel viewModel;

  _AuthTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AuthTablet')),
    );
  }
}