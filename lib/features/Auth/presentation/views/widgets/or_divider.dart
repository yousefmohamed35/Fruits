import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
        const SizedBox(width: 18),
        Text(
          'أو',
          style: TextStyles.semiBold13.copyWith(color: const Color(0xff0C0D0D)),
        ),
        const SizedBox(width: 18),
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
      ],
    );
  }
}
