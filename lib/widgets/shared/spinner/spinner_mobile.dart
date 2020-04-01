part of spinner_widget;

class _SpinnerMobile extends StatelessWidget {
  final Color color;

  const _SpinnerMobile({this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          strokeWidth: 3, valueColor: AlwaysStoppedAnimation(Colors.white)),
    );
  }
}
