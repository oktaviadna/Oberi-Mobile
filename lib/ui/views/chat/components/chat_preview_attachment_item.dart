import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oberi_mobile/core/helper/file_helper.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class ChatPreviewAttachmentItem extends StatelessWidget {
  final int index;
  final File data;
  final Function deleteOnTap;

  const ChatPreviewAttachmentItem({
    Key? key,
    required this.data,
    required this.index,
    required this.deleteOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          data.path.contains('pdf') ? _file() : _image(),
          Positioned(
            top: 4,
            right: 4,
            child: InkWell(
              onTap: () => deleteOnTap(),
              child: const CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _file() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          const SkyImage(src: 'assets/images/ic_clip.svg'),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.path.split('/').last,
                style: AppStyle.body1,
              ),
              const SizedBox(height: 4),
              Text(
                FileHelper.getFileSizeString(bytes: data.lengthSync()),
                style: AppStyle.subtitle4.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _image() {
    return SkyImage(
      src: data.path,
      height: 90,
      width: 90,
      fit: BoxFit.cover,
      fromFile: true,
      borderRadius: BorderRadius.circular(6),
    );
  }
}
