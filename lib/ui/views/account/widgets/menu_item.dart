import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_box.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      elevation: 0,
      width: double.infinity,
      borderRadius: 4,
      borderColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      onPressed: onTap,
      child: Text(title, style: AppStyle.subtitle4),
    );
  }
}
