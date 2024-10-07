import 'package:flutter/material.dart';
import 'package:oberi_mobile/ui/widgets/media/media_helper.dart';
import 'package:oberi_mobile/ui/widgets/sky_appbar.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';
import 'package:oberi_mobile/ui/widgets/sky_video.dart';

class MediaPreviewPage extends StatelessWidget {
  final String url;
  final bool fromFile;

  const MediaPreviewPage({
    Key? key,
    required this.url,
    this.fromFile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SkyAppBar.primary(
          title: 'Media Preview',
        ),
        body: _determineMedia(url));
  }

  Widget _determineMedia(String path) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return Center(
          child: SkyImage(
            src: mediaType.path,
            fromFile: fromFile,
          ),
        );
      case MediaType.video:
        return SkyVideo(
          url: mediaType.path,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
