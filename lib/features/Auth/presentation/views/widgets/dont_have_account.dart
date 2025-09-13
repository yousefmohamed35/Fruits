import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تملك حساب؟ ',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
            text: ' قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xff1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
