import 'package:flutter/material.dart';

import '../../decoration/base_color.dart';
import '../../style/base_text_style.dart';
import '../loading/circular_loading.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final EdgeInsets outerPadding;
  final EdgeInsets innerPadding;
  final bool transparent;
  final double? heightSize;
  final double fontSize;
  final double borderRadius;
  final bool isLoading;

  const BaseButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.heightSize = 55,
    this.outerPadding = EdgeInsets.zero,
    this.innerPadding = const EdgeInsets.all(12),
    this.transparent = false,
    this.fontSize = 18,
    this.borderRadius = 10,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                if (!isLoading) {
                  onPressed!();
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: !transparent
                    ? BaseColor.primary
                    : BaseColor.primary.withOpacity(
                        0.05,
                      ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: const BorderSide(
                    color: BaseColor.primary,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: !isLoading
                  ? Text(
                      text,
                      style: BaseTextStyle.paragraph1Semibold(
                        color: transparent
                            ? BaseColor.primary
                            : BaseColor.neutral0,
                      ),
                    )
                  : const SizedBox(
                      height: 24,
                      width: 24,
                      child: BaseCircularLoading(
                        color: BaseColor.neutral0,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
