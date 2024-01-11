import 'package:flutter/material.dart';

import '../../app/constatns/app_size.dart';
import '../../app/utils.dart';
import 'text.dart';

class CircleBorderValue extends StatelessWidget {
  const CircleBorderValue({
    super.key,
    required this.color,
    required this.type,
    required this.value,
  });
  final Color color;
  final String type;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.s50,
          width: AppSize.s50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2)),
          child: PText(
            text: value,
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.normal,
          ),
        ),
        box(5),
        PText(
          text: type,
          fontSize: 13,
          color: color,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }
}
