part of base_page_widget;

class _BasePageMobile extends StatelessWidget {
  final String pageName;
  final Widget content;

  const _BasePageMobile({this.pageName = '', @required this.content});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text('$pageName', style: theme.textTheme.headline1),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}
