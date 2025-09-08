import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});
  static String routeName = '/learning';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBA7DF5),
        elevation: 0,
        title: Text(
          'Learning Hub',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Courses......',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter Chips
            Wrap(
              spacing: 8,
              children: [
                _buildChip('All', isSelected: true),
                _buildChip('Completed'),
                _buildChip('In Progress'),
                _buildChip('New'),
              ],
            ),
            const SizedBox(height: 16),

            // Learning Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4E9FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _SummaryItem(label: 'Active Courses', value: '4'),
                      _SummaryItem(label: 'Lessons Done', value: '41'),
                      _SummaryItem(label: 'Remaining', value: '39'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // My Courses Section
            Text(
              'My Courses',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Course Cards
            _buildCourseCard(
              category: 'Mobile Dev',
              title: 'Flutter Mastery',
              progress: 0.9,
            ),
            _buildCourseCard(
              category: 'DevOps',
              title: 'Cloud Fundamentals',
              progress: 0.6,
            ),
            _buildCourseCard(
              category: 'Data Science',
              title: 'Python for Data Analysis',
              progress: 0.4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Chip(
      backgroundColor: isSelected ? const Color(0xFFBA7DF5) : Colors.grey[300],
      label: Text(
        label,
        style: GoogleFonts.poppins(
          color: isSelected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String category,
    required String title,
    required double progress,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 12),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: const Color(0xFFBA7DF5),
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('DETAILS')),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBA7DF5),
                ),
                child: const Text('CONTINUE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7A00CC),
          ),
        ),
        Text(label, style: GoogleFonts.poppins(fontSize: 12)),
      ],
    );
  }
}
