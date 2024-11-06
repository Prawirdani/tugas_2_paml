import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';
import 'package:tugas_2_paml/widgets/debug.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tertiary.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              width: 120,
              height: 120,
              child: const Center(
                child: Text('Image Placeholder', textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Headline',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, elit. sed do eiusmod tempor. incididunt ut labore et dolore.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline),
                        SizedBox(width: 4),
                        Text("43 min"),
                        Spacer(),
                        Icon(Icons.play_arrow),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
