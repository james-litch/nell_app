part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);
// have actions

  @override
  Widget build(BuildContext context) {
    Widget menuButton = GestureDetector(
      onTap: () {
        viewModel.title = 'menu';
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.menu),
      ),
    );
    Widget accountButton = GestureDetector(
      onTap: () {
        viewModel.title = 'account';
        viewModel.onAccount();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.title),
        leading: menuButton,
        actions: <Widget>[accountButton],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
