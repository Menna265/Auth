import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  String label;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?)? validator;
  CustomTextFormFeild({
    required this.label,
    this.keyboardType=TextInputType.text,
    required this.controller,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType:keyboardType,
        controller:controller ,
        validator:validator ,

        decoration: InputDecoration(
          label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 3
            )
          )
        ),

      ),
    );
  }
}
