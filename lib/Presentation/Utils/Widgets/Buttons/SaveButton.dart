import 'package:flutter/material.dart';

import '../../../../Package/Constants.dart';
import '../../../../Package/CustomeTexts.dart';
import '../../../../Package/RippleEffectContainer.dart';
import '../../Constants.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.height,
    required this.width,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });
  final double height;
  final double width;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ClickEffect(
      onTap: onTap,
      borderRadius: radius(10),
      child: Container(
        height: 48,
        width: DP.infinity(context),
        decoration:
            BoxDecoration(color: backgroundColor, borderRadius: radius(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.save_outlined, color: backgroundColor),
            TextFW500(
              text: label,
              fontSize: 16,
              textcolor: white,
            ),
            Icon(icon, color: white)
          ],
        ),
      ),
    );
  }
}
