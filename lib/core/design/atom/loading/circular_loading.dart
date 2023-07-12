import 'package:flutter/material.dart';

import '../../decoration/base_color.dart';

class BaseCircularLoading extends StatelessWidget {
  final Color? color;

  const BaseCircularLoading({
    this.color = BaseColor.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
