import 'package:flutter/material.dart';

class BrandButton extends StatelessWidget {
  final String label;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final Widget brandIcon;

  const BrandButton({
    required this.brandIcon,
    required this.label,
    this.height = 48,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            brandIcon,
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 1.41),
            )
          ],
        ),
      ),
    );
  }
}