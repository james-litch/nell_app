part of users_page_widget;

class _UsersPageMobile extends StatelessWidget {
  final viewModel;

  const _UsersPageMobile({@required this.viewModel});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget usersList = viewModel.currentSubject == null ||
    viewModel.currentSubject.users.length == 0
        ? Center(child: Text('no users'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.users.length,
            itemBuilder: (context, int index) {
              return UserCardWidget(
                user: viewModel.currentSubject.users[index],
              );
            });

    Widget adminsList = viewModel.currentSubject == null ||
            viewModel.currentSubject.admins.length == 0
        ? Center(child: Text('No admins'))
        : ListView.builder(
            itemCount: viewModel.currentSubject.admins.length,
            itemBuilder: (context, int index) {
              return UserCardWidget(
                user: viewModel.currentSubject.admins[index],
              );
            });

    return BasePageWidget(
        pageName: 'Users',
        content: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Admins', style: theme.textTheme.headline3),
            ),
            Expanded(child: adminsList),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Standard users', style: theme.textTheme.headline3),
            ),
            Expanded(child: usersList)
          ],
        ));
  }
}
