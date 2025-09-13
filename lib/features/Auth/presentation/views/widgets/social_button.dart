import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.title, required this.onPressed, required this.imageIcon});
  final String title;
  final void Function()? onPressed;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xffDCDEDE)),
          ),
        ),
        onPressed: () {},
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16,
          ),
          leading: SvgPicture.asset(imageIcon),
        ),
      ),
    );
  }
}
