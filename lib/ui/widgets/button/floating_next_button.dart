import 'package:flutter/material.dart';

import '../../theme/colors.dart';

FloatingActionButton FloatingNextButton({
  required void Function()? onPressed,
  required bool active,
  Color? activeColor,
  Color? inactiveColor,
}) {
  bool _active = active;
  Color _activeColor = activeColor ?? KurlyColors.purple100;
  Color _inactiveColor = inactiveColor ?? KurlyColors.grey120;
  return FloatingActionButton(
      onPressed: (_active) ? onPressed : null,
      backgroundColor: (_active) ? _activeColor : _inactiveColor,
      child: Image.asset(
        'assets/icons/arrow_right.png',
        width: 27,
      ));
}
