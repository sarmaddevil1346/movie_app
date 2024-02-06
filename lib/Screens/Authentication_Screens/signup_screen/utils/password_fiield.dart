import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';

class PasswordTextFieldsWidget extends StatefulWidget {
  final String text;
  final ValueChanged<bool>? onToggleVisibility;
  final OutlineInputBorder outlineInputBorder;

  const PasswordTextFieldsWidget({
    Key? key,
    required this.text,
    this.onToggleVisibility,
    required this.outlineInputBorder,
  }) : super(key: key);

  @override
  _PasswordTextFieldsWidgetState createState() =>
      _PasswordTextFieldsWidgetState();
}

class _PasswordTextFieldsWidgetState extends State<PasswordTextFieldsWidget> {
  bool _isObscure = false;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
      if (widget.onToggleVisibility != null) {
        widget.onToggleVisibility!(_isObscure);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: TextStyle(color: Colors.white54),
        suffixIcon: IconButton(
          onPressed: () {
            _toggleVisibility();
          },
          icon: Icon(
              color: AppColors.whiteColor,
              _isObscure ? Icons.visibility_off_rounded : Icons.visibility),
        ),
        border: widget.outlineInputBorder,
      ),
      style: TextStyle(color: AppColors.whiteColor),
    );
  }
}
