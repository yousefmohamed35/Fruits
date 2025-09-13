import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String text) {
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text)));
  }