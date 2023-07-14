import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    this.hint,
    this.icon,
    this.label,
    this.onChange,
    this.controller,
    this.obSecure=false,
    this.enabled=true,

    this.prefixIcon,
    this.type})
      : super(key: key);
  final Function(String)? onChange;
  final String? label;
  final String? hint;
  final IconButton? icon;
  final TextInputType? type;
  final bool? obSecure;
  final  IconData ?prefixIcon;
  final bool? enabled;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: type,
        onChanged: onChange,
        autofocus: true,
        enabled:  enabled,

        obscureText: obSecure!,
        decoration: InputDecoration(
          // prefixIcon: prefixIcon,
            prefixIcon: icon,
            // prefixIcon: Icon(prefixIcon, color:Colors.grey, size: 25),
            labelText: label!,
            labelStyle: TextStyle(
                color:Colors.grey, fontSize: 12),
            hintStyle: const TextStyle(
              fontSize:14, color: Colors.grey,),
            hintText: hint!,
            enabledBorder: OutlineInputBorder(
              borderSide:   BorderSide(color:Colors.grey),
              borderRadius: BorderRadius.circular(20),),
            disabledBorder: OutlineInputBorder(
              borderSide:   BorderSide(color:Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10),),
            focusedBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}




