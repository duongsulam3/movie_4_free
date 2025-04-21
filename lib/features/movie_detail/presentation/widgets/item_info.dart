import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.movieName,
    required this.movieQuality,
    required this.episodeName,
    required this.episodeTime,
  });

  final String movieName;
  final String movieQuality;
  final String episodeName;
  final String episodeTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ResponsiveText(
              text: movieName,
              fontSize: 16,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: "Chất lượng: $movieQuality",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: episodeName.contains("Tập") || episodeName.contains("tập")
                  ? episodeName
                  : "Tập $episodeName",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: "Thời lượng: $episodeTime",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
