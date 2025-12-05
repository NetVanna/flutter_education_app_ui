import 'package:education_app/data/data.dart';
import 'package:education_app/screens/courses/course_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    /// responsive text size
    final textScaleFactor = size.width / 400;

    /// apply responsive text theme
    final responsiveTextTheme = theme.textTheme.copyWith(
      displayLarge: theme.textTheme.displayLarge!.copyWith(
        fontSize: 28 * textScaleFactor,
      ),
      displayMedium: theme.textTheme.displayMedium!.copyWith(
        fontSize: 22 * textScaleFactor,
      ),
      bodyLarge: theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16 * textScaleFactor,
      ),
      bodyMedium: theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14 * textScaleFactor,
      ),
    );
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// header with welcome
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.03,
                    horizontal: size.width * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.05,
                        ),
                        blurRadius: 20,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Alex,",
                            style: responsiveTextTheme.displayMedium,
                          ),
                          Text(
                            "What do you want learn today?",
                            style: responsiveTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              theme.colorScheme.primary,
                              theme.colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            size.width * 0.05,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.3,
                              ),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: size.width * 0.06,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: size.width * 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),

                /// search bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search fo courses",
                      hintStyle: TextStyle(
                        fontSize: 14 * textScaleFactor,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        size: 22 * textScaleFactor,
                        color: theme.colorScheme.primary,
                      ),
                      suffixIcon: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: theme.colorScheme.primary,
                          size: 22 * textScaleFactor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),

                /// categories list
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: responsiveTextTheme.displayMedium,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 12 * textScaleFactor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),

                /// category grid view
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 600 ? 4 : 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: size.width * 0.03,
                    mainAxisSpacing: size.width * 0.03,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            theme.colorScheme.surface,
                            theme.colorScheme.surface.withValues(alpha: 0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.1,
                            ),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: category.color.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  category.icon,
                                  color: category.color,
                                  size: 24 * textScaleFactor,
                                ),
                              ),
                              SizedBox(height: 8 * textScaleFactor),
                              Text(
                                category.title,
                                style: TextStyle(
                                  fontSize: 14 * textScaleFactor,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),

                /// trending courses
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Courses",
                      style: responsiveTextTheme.displayMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "See all",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingCourses.length,
                    itemBuilder: (context, index) {
                      final courses = trendingCourses[index];
                      return Container(
                        width: size.width * 0.7,
                        margin: EdgeInsets.only(right: size.width * 0.04),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colorScheme.surface,
                              theme.colorScheme.surface.withValues(alpha: 0.9),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.05,
                              ),
                              blurRadius: 15,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.width * 0.33,
                              padding: EdgeInsets.all(size.width * 0.04),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    courses.color,
                                    courses.color.withValues(alpha: 0.8),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: courses.color.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      courses.icon,
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      size: size.width * 0.2,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      height: size.width * 0.1,
                                      width: size.width * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.1,
                                            ),
                                            blurRadius: 10,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: courses.color,
                                        size: size.width * 0.06,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.width * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.1,
                                            ),
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: courses.color,
                                            size: 16 * textScaleFactor,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            courses.rating,
                                            style: TextStyle(
                                              fontSize: 12 * textScaleFactor,
                                              fontWeight: FontWeight.bold,
                                              color: courses.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.width * 0.04),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    courses.title,
                                    style: TextStyle(
                                      fontSize: 16 * textScaleFactor,
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  SizedBox(height: size.width * 0.01),
                                  Text(
                                    courses.subtitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14 * textScaleFactor,
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                                  ),
                                  SizedBox(height: size.width * 0.01),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.6),
                                        size: 16 * textScaleFactor,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        courses.lesson,
                                        style: TextStyle(
                                          fontSize: 14 * textScaleFactor,
                                          color: theme.colorScheme.primary
                                              .withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
