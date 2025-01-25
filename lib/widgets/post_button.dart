import 'package:flutter/material.dart';

import '../util/color_resources.dart';
import '../util/dimensions.dart';
import '../util/styles.dart';

class PostButton extends StatelessWidget {
  final Widget? icon;
  final String? label;
  final Color color;
  final VoidCallback? onTap;
  final bool levelColor;
  final TextStyle? textStyle;
  const PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = Colors.black,  this.levelColor = false, this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: SizedBox(
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!,
              const SizedBox(width: 9,),
              Text(label ?? '', style: textStyle ?? interMedium.copyWith(color: levelColor ? ColorResources.red : const Color(0xFF252525).withOpacity(0.8), fontSize: Dimensions.fontSizeSmall)),
            ],
          ),
        ),
      ),
    );
  }
}