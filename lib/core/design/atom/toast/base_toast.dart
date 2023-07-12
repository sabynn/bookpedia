import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../decoration/base_color.dart';
import '../../style/base_text_style.dart';

class BaseToast {
  static show({
    String? text,
    String? action,
    Function()? onTap,
    Duration duration = const Duration(seconds: 1),
    BaseToastStyle style = BaseToastStyle.NORMAL,
  }) {
    Color bgColor = BaseColor.neutral1000;
    if (style == BaseToastStyle.SUCCESS) {
      bgColor = BaseColor.success700;
    } else if (style == BaseToastStyle.DANGER) {
      bgColor = BaseColor.danger700;
    }
    if (style == BaseToastStyle.WARNING) {
      bgColor = BaseColor.warning700;
    }
    Get.rawSnackbar(
      messageText: Row(
        children: [
          Flexible(
            child: Text(
              text ?? '',
              style: BaseTextStyle.paragraph2Regular(
                color: BaseColor.neutral0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (action != null) const Spacer(),
          if (action != null)
            InkWell(
              onTap: onTap,
              child: Text(
                action,
                style: BaseTextStyle.paragraph2Regular(
                  color: BaseColor.neutral0,
                ),
              ),
            )
        ],
      ),
      duration: duration,
      borderRadius: 4,
      backgroundColor: bgColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

enum BaseToastStyle { NORMAL, SUCCESS, DANGER, WARNING }
