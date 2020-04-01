part of rounded_text_box_widget;

class _RoundedTextBoxMobile extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final Color primaryColor;
  final Color secondaryColor;
  final bool boarder;
  final IconData icon;

  _RoundedTextBoxMobile({
    @required this.controller,
    @required this.isPassword,
    @required this.label,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.boarder,
    this.icon,
  }) : assert(controller != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(color: secondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        style: TextStyle(color: secondaryColor, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(6.0),
          hintText: label,
          hintStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: icon == null ? null : Icon(icon, color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
