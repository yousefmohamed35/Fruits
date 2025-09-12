 import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context,{required String title}) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title,style: TextStyles.bold19,),
    );
  }