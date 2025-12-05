import 'package:flutter/material.dart';

/// course category
class CategoryData {
  final String title;
  final IconData icon;
  final Color color;

  CategoryData({required this.title, required this.icon, required this.color});
}

/// course data
class CourseData {
  final String title;
  final String subtitle;
  final String rating;
  final String lesson;
  final Color color;
  final IconData icon;

  CourseData({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.lesson,
    required this.color,
    required this.icon,
  });
}

/// category filter option
class FilterOption {
  final String label;
  final bool isSelected;

  FilterOption({required this.label, this.isSelected = false});
}
