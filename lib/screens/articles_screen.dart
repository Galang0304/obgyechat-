import 'package:flutter/material.dart';
import '../constants/image_paths.dart';
import '../utils/placeholder_image.dart';
import './article_detail_screen.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel & Tips'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildCategorySection(),
          const SizedBox(height: 24),
          _buildArticlesList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Cari artikel...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'icon': Icons.restaurant, 'label': 'Nutrisi', 'color': Colors.orange},
      {'icon': Icons.fitness_center, 'label': 'Olahraga', 'color': Colors.blue},
      {'icon': Icons.medical_services, 'label': 'Kesehatan', 'color': Colors.green},
      {'icon': Icons.psychology, 'label': 'Mental', 'color': Colors.purple},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: (category['color'] as Color).withOpacity(0.2),
                  child: Icon(
                    category['icon'] as IconData,
                    color: category['color'] as Color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category['label'] as String,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildArticlesList() {
    final articles = [
      {
        'title': 'Tips Nutrisi Penting untuk Ibu Hamil Trimester Pertama',
        'description':
            'Pelajari nutrisi penting yang dibutuhkan selama trimester pertama kehamilan.',
        'image': ImagePaths.nutritionArticle,
        'category': 'Nutrisi',
        'color': Colors.orange,
      },
      {
        'title': 'Olahraga Aman untuk Ibu Hamil',
        'description':
            'Panduan lengkap tentang jenis olahraga yang aman dilakukan selama kehamilan.',
        'image': ImagePaths.exerciseArticle,
        'category': 'Olahraga',
        'color': Colors.blue,
      },
      {
        'title': 'Mengatasi Morning Sickness',
        'description':
            'Tips dan trik mengatasi mual muntah di pagi hari selama kehamilan.',
        'image': ImagePaths.morningArticle,
        'category': 'Kesehatan',
        'color': Colors.green,
      },
      {
        'title': 'Menjaga Kesehatan Mental Selama Kehamilan',
        'description':
            'Pentingnya menjaga kesehatan mental dan cara mengelola stress selama kehamilan.',
        'image': ImagePaths.mentalArticle,
        'category': 'Mental',
        'color': Colors.purple,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailScreen(article: {
                    ...article,
                    'content': {
                      'pendahuluan': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      'poin_penting': [
                        'Poin 1: Ut enim ad minim veniam',
                        'Poin 2: Quis nostrud exercitation ullamco',
                        'Poin 3: Duis aute irure dolor in reprehenderit',
                      ],
                      'kesimpulan': 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    },
                  }),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  child: Image.asset(
                    article['image'] as String,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return PlaceholderImage(
                        category: article['category'] as String,
                        backgroundColor: (article['color'] as Color).withOpacity(0.1),
                        iconColor: article['color'] as Color,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (article['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          article['category'] as String,
                          style: TextStyle(
                            color: article['color'] as Color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article['title'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article['description'] as String,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 