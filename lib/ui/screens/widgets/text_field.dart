import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String prefix;
  final TextEditingController controller;
  final Function onChanged;

  const CustomTextField({
    Key key,
    @required this.label,
    @required this.controller,
    @required this.prefix,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            labelText: label,
            prefix: Text(prefix),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            )),
      ),
    );
  }
}
