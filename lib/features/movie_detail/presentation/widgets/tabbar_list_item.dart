import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/item_info.dart';

class TabBarListItem extends StatelessWidget {
  const TabBarListItem({
    super.key,
    this.isCurrentlyPlaying = false,
    required this.sHeight,
    required this.imagePath,
    required this.movieName,
    required this.movieQuality,
    required this.episodeName,
    required this.episodeTime,
    required this.onTap,
  });

  /// When true, shows a dim overlay on the thumbnail with "Đang chiếu".
  final bool isCurrentlyPlaying;
  final double sHeight;
  final String imagePath;
  final String movieName;
  final String movieQuality;
  final String episodeName;
  final String episodeTime;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: sHeight / (sHeight / 120),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff575966),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ContainerWithCachedNetworkImageProvider(
                    path: imagePath,
                  ),
                  if (isCurrentlyPlaying) const _EpisodePlayingOverlay(),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: ItemInfo(
                movieName: movieName,
                movieQuality: movieQuality,
                episodeName: episodeName,
                episodeTime: episodeTime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Dim overlay + label for the episode row thumbnail when it matches the active stream.
class _EpisodePlayingOverlay extends StatelessWidget {
  const _EpisodePlayingOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black.withValues(alpha: 0.7),
        child: const Center(
          child: ResponsiveText(
            text: 'Đang chiếu',
            textColor: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
