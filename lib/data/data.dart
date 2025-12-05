import 'package:education_app/models/model.dart';
import 'package:flutter/material.dart';

final List<CategoryData> categories = [
  CategoryData(
    title: "Programming",
    icon: Icons.code,
    color: Color(0xFF4264FB),
  ),
  CategoryData(
    title: "Mathematics",
    icon: Icons.calculate,
    color: Color(0xFF42BB83),
  ),
  CategoryData(title: "Science", icon: Icons.science, color: Color(0xFFFF7043)),
  CategoryData(
    title: "Language",
    icon: Icons.language,
    color: Color(0xFFFFC107),
  ),
  CategoryData(title: "Design", icon: Icons.brush, color: Color(0xFF3F51B5)),
  CategoryData(
    title: "Business",
    icon: Icons.business,
    color: Color(0xFFE91E63),
  ),
];

/// list trending course
final List<CourseData> trendingCourses = [
  CourseData(
    title: "Flutter Development",
    subtitle: "Build Ios and Android app use with codebases",
    rating: "4.9",
    lesson: "20 Lessons",
    color: Color(0xFF4264FB),
    icon: Icons.flutter_dash,
  ),
  CourseData(
    title: "Python Programming",
    subtitle: "Learn Python Programming",
    rating: "4.8",
    lesson: "25 Lessons",
    color: Color(0xFF42B883),
    icon: Icons.code,
  ),
  CourseData(
    title: "UI/UX Design",
    subtitle: "Design beautiful user interfaces",
    rating: "4.7",
    lesson: "10 Lessons",
    color: Color(0xFFFF7043),
    icon: Icons.brush,
  ),
];

/// list all courses
final List<CourseData> allCourses = [
  ...trendingCourses,

  CourseData(
    title: "Web Development",
    subtitle: "HTML, CSS, JavaScript & modern frameworks",
    rating: "4.8",
    lesson: "30 Lessons",
    color: Color(0xFF1E88E5),
    icon: Icons.web,
  ),

  CourseData(
    title: "Data Structures & Algorithms",
    subtitle: "Master essential DSA concepts",
    rating: "4.9",
    lesson: "40 Lessons",
    color: Color(0xFF6A1B9A),
    icon: Icons.storage,
  ),

  CourseData(
    title: "Digital Marketing",
    subtitle: "Grow business using online platforms",
    rating: "4.6",
    lesson: "18 Lessons",
    color: Color(0xFFFFC107),
    icon: Icons.campaign,
  ),

  CourseData(
    title: "Java Programming",
    subtitle: "Learn core Java & OOP concepts",
    rating: "4.7",
    lesson: "28 Lessons",
    color: Color(0xFF0D47A1),
    icon: Icons.computer,
  ),

  CourseData(
    title: "Cybersecurity Basics",
    subtitle: "Learn to secure systems and networks",
    rating: "4.8",
    lesson: "22 Lessons",
    color: Color(0xFF00897B),
    icon: Icons.security,
  ),
];

/// list for filter options
final List<FilterOption> filterOptions = [
  FilterOption(label: "All", isSelected: true),
  FilterOption(label: "Programming"),
  FilterOption(label: "Mathematics"),
  FilterOption(label: "Science"),
  FilterOption(label: "Language"),
  FilterOption(label: "Design"),
  FilterOption(label: "Business"),
];
