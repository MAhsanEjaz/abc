import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Custom Text Fields
class CustomTextField extends StatefulWidget {
  late IconData? prefixIcon;
  late IconData? postfixIcon;
  final String? labelText;
  final String? hintText;
  Function(String value)? onSubmit;
  final double width;
  Widget? prefix;
  final Function(String)? onchange;
  final Function()? onPressed;
  final bool obscure;
  final bool readOnly;
  final TextInputType? type;
  final TextEditingController? controller;

  // late final FocusNode? focusNode;
  final FocusNode? focusNode;
  final int? length;
  final TextInputAction textInputAction;

  CustomTextField({
    this.prefix,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.readOnly = false,
    this.type,
    this.controller,
    this.width = double.infinity,
    this.prefixIcon,
    this.postfixIcon,
    this.onSubmit,
    this.onchange,
    this.obscure = false,
    this.length,
    this.textInputAction = TextInputAction.done,
    this.onPressed,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // bool _validate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (widget.labelText == null)
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.labelText!,
                      // style: TextStyle(color: TextFieldTitleColor),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: 6.0),
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              // height: widget.height,
              width: widget.width,
              child: TextField(
                // textCapitalization: TextCapitalization.characters,
                onSubmitted: (widget.onSubmit),
                readOnly: widget.readOnly,
                minLines: 1,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(widget.length)
                ],
                onChanged: widget.onchange,
                controller: widget.controller,
                obscureText: widget.obscure,
                keyboardType: widget.type,
                focusNode: widget.focusNode,
                textInputAction: widget.textInputAction,

                style: TextStyle(
                  color: Color(0xFF727272),
                  fontSize: 14.0,
                ),
                // cursorColor: Color(0xFF7f7f7f),
                decoration: InputDecoration(
                  // suffix: widget.prefix == null ? null : widget.prefix,
                  contentPadding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),

                  fillColor: Colors.white,
                  // fillColor: Color(0xFFBED0E9),//BED0E9
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  filled: true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Color(0xFF7f7f7f)),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFdedede),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFdedede),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),

                  prefixIcon: widget.prefixIcon == null
                      ? null
                      : Icon(
                          widget.prefixIcon,
                          color: Color(0xFF818181),
                        ),
                  suffixIcon: widget.postfixIcon == null
                      ? null
                      : IconButton(
                          icon: Icon(widget.postfixIcon),
                          onPressed: widget.onPressed,
                          color: Color(0xFF818181),
                          // color: Colors.black54,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
