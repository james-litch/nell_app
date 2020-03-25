part of subject_menu_item_widget;

class _SubjectMenuItemMobile extends StatelessWidget {
  final Subject subject;
  final onTap;

  const _SubjectMenuItemMobile({@required this.subject, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      title: Center(
        child: Text(
          '${subject.name}',
          textAlign: TextAlign.center,
          style: theme.textTheme.headline2,
        ),
      ),
    );
  }
}
