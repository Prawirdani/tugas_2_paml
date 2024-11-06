import 'package:flutter/material.dart';
import 'package:tugas_2_paml/presentation/main/widgets/podcast_card.dart';
import 'package:tugas_2_paml/presentation/main/widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recently Played',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) => const SongCard()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Podcasts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => const PodcastCard(),
            ),
          ),
        ],
      ),
    );
  }
}
