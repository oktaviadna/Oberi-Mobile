import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/ui/widgets/media/media_helper.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:oberi_mobile/ui/widgets/sky_video.dart';

import 'media_preview_page.dart';

class MediaListPreviewPage extends StatelessWidget {
  const MediaListPreviewPage({Key? key, required this.mediaUrls})
      : super(key: key);
  final List<String> mediaUrls;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var item in mediaUrls) {
      children.add(_determineMedia(item));
      children.add(const Divider());
    }
    return Scaffold(
      appBar: SkyAppBar.primary(
        title: 'Preview Media',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _determineMedia(String path) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return SkyImage(src: mediaType.path);
      case MediaType.video:
        return SkyVideo(
          url: mediaType.path,
          height: 400,
          showControls: false,
          onTapVideo: () => Get.to(MediaPreviewPage(url: mediaType.path)),
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
