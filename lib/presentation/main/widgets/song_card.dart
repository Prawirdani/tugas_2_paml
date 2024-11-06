import 'package:flutter/material.dart';
import 'package:tugas_2_paml/config/theme/colors.dart';

class SongCard extends StatefulWidget {
  const SongCard({super.key});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.tertiary.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 8,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Artist', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Song'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
