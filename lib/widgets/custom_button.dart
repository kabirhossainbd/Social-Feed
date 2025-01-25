import 'package:flutter/material.dart';

import '../util/color_resources.dart';
import '../util/dimensions.dart';
import '../util/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;
  final bool isColor;
  const CustomButton({ Key? key , this.onTap, required this.buttonText, this.isColor = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Bouncing(
        onPress: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isColor ? ColorResources.COLOR_PRIMARY : ColorResources.disableBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(buttonText,
            style: interMedium.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: isColor ? ColorResources.COLOR_WHITE : ColorResources.disableText
            ), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}


class Bouncing extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onPress;
  const Bouncing({required this.child, Key? key, this.onPress}): assert(child != null), super(key: key);

  @override
  _BouncingState createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing> with SingleTickerProviderStateMixin {
  double _scale = 0.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (widget.onPress != null) {
          _controller.forward();
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (widget.onPress != null) {
          _controller.reverse();
          widget.onPress!();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}