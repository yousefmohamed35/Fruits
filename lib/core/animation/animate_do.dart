import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomBounceInDown extends StatelessWidget {
  const CustomBounceInDown({
    super.key,
    required this.child,
    required this.duration,
  });
  final Widget child;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      delay: Duration(milliseconds: 300),
      duration: duration,
      child: child,
    );
  }
}