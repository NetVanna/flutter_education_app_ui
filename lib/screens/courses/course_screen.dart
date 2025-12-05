import 'package:education_app/data/data.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    /// responsive text size
    final textScaleFactor = size.width / 400;
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "All Courses",
          style: TextStyle(
            fontSize: 20 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.8),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.primary,
              size: 20 * textScaleFactor,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.filter_list,
              color: theme.colorScheme.primary,
              size: 20 * textScaleFactor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
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

              /// category filter chips
              SizedBox(
                height: size.height * 0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterOptions.length,
                  itemBuilder: (context, index) {
                    final filter = filterOptions[index];
                    return Container(
                      margin: EdgeInsets.only(right: size.width * 0.02),
                      child: FilterChip(
                        label: Text(
                          filter.label,
                          style: TextStyle(
                            fontSize: 14 * textScaleFactor,
                            color: filter.isSelected
                                ? Colors.white
                                : theme.colorScheme.primary,
                            fontWeight: filter.isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: filter.isSelected,
                        onSelected: (value) {},
                        backgroundColor: theme.colorScheme.surface,
                        selectedColor: theme.colorScheme.primary,
                        checkmarkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: filter.isSelected
                                ? Colors.transparent
                                : theme.colorScheme.primary.withValues(
                                    alpha: 0.2,
                                  ),
                          ),
                        ),
                        elevation: filter.isSelected ? 3 : 0,
                        shadowColor: filter.isSelected
                            ? theme.colorScheme.primary.withValues(alpha: 0.3)
                            : Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.02,
                          vertical: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Courses",
                    style: TextStyle(
                      fontSize: 18 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.width * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.05,
                          ),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: theme.colorScheme.primary,
                          size: 14 * textScaleFactor,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Sort By",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12 * textScaleFactor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > 600 ? 3 : 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: size.width * 0.03,
                    mainAxisSpacing: size.width * 0.03,
                  ),
                  itemCount: allCourses.length,
                  itemBuilder: (context, index) {
                    final courses = allCourses[index];
                    return Container(
                      margin: EdgeInsets.only(right: 5),
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
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        courses.color,
                                        courses.color.withValues(alpha: 0.9),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Icon(
                                          courses.icon,
                                          color: Colors.white,
                                          size: 40 * textScaleFactor,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 16 * textScaleFactor,
                                                color: courses.color,
                                              ),
                                              Text(
                                                courses.rating,
                                                style: TextStyle(
                                                  fontSize:
                                                      12 * textScaleFactor,
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(size.width * 0.02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courses.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14 * textScaleFactor,
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
                                          fontSize: 12 * textScaleFactor,
                                          color: theme.colorScheme.onSurface
                                              .withValues(alpha: 0.8),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: theme.colorScheme.primary,
                                            size: 16 * textScaleFactor,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            courses.lesson,
                                            style: TextStyle(
                                              fontSize: 12 * textScaleFactor,
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
