import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oberi_mobile/ui/widgets/media/media_helper.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:oberi_mobile/ui/widgets/sky_video.dart';

class DetermineUploadItem extends StatelessWidget {
  const DetermineUploadItem({
    Key? key,
    required this.item,
    this.itemSize = 40,
  }) : super(key: key);

  final File? item;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    final mediaType = MediaHelper.getMediaType('${item?.path}');
    switch (mediaType.type) {
      case MediaType.file:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          height: itemSize,
          width: itemSize,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.5),
          ),
          child: const Center(
            child: SkyImage(
              src: 'assets/images/ic_clip.svg',
            ),
          ),
        );
      case MediaType.image:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: SkyImage(
            src: mediaType.path,
            height: itemSize,
            width: itemSize,
            borderRadius: BorderRadius.circular(4.5),
            fit: BoxFit.cover,
            fromFile: true,
          ),
        );
      case MediaType.video:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: SkyVideo(
            url: mediaType.path,
            height: itemSize,
            width: itemSize,
            borderRadius: 4.5,
            showControls: false,
          ),
        );
      case MediaType.unknown:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          height: itemSize,
          width: itemSize,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.5),
          ),
          child: const Center(
            child: SkyImage(
              src: 'assets/images/ic_clip.svg',
            ),
          ),
        );
    }
  }
}
