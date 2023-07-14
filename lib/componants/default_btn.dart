import 'package:flutter/material.dart';


class DefaultBtn extends StatelessWidget {
  const DefaultBtn({
    Key? key,
    required this.title,
    required this.onTap,
    required this.loading,
    this.color,
    this.textColor,
    this.decoration,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final Color? color;
  final Color? textColor;
  final BoxDecoration? decoration;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => loading ? null : onTap(),
      child: Container(
        decoration: decoration ??
            BoxDecoration(
                color: color ?? Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,fontSize: 17.0, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
