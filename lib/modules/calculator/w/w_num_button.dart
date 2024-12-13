import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNumberButton extends StatelessWidget {
  final String number;
  final Color background;
  final Color textColor;
  final bool isSign;
  final String? svg;
  final Function onPress;
  final bool? isOperatorPress;

  const CustomNumberButton({
    super.key,
    required this.number,
    required this.background,
    required this.textColor,
    this.isSign = false,
    this.svg,
    required this.onPress,
    this.isOperatorPress = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSign && svg == null) {
      throw ArgumentError('SVG must be provided when isSign is true.');
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: isOperatorPress! ? background.withRed(1) : background,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 60,
        child: InkWell(
          onTap: () {
            onPress();
          },
          child: Center(
            child: isSign
                ? SvgPicture.string(
                    svg!,
                    colorFilter: ColorFilter.mode(
                      textColor,
                      BlendMode.srcIn,
                    ),
                  )
                : Text(
                    number,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
