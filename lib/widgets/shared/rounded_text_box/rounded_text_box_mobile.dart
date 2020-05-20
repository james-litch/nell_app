part of rounded_text_box_widget;

class _RoundedTextBoxMobile extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final IconData icon;
  final onChnaged;

  _RoundedTextBoxMobile({
    @required this.controller,
    @required this.isPassword,
    @required this.label,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    this.icon,
    this.onChnaged,
  }) : assert(controller != null);

  @override
  __RoundedTextBoxMobileState createState() => __RoundedTextBoxMobileState();
}

class __RoundedTextBoxMobileState extends State<_RoundedTextBoxMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.primaryColor,
        border: Border.all(color: widget.secondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        onChanged: widget.onChnaged,
        obscureText: widget.isPassword,
        controller: widget.controller,
        style: TextStyle(color: widget.secondaryColor, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(6.0),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: widget.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.icon == null ? null : Icon(widget.icon, color: widget.secondaryColor),
          ),
        ),
      ),
    );
  }
}
