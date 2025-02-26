import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/text_button.dart';
import 'package:portfolio/model/category_model.dart';
import 'package:portfolio/model/photo_model.dart';
import 'package:portfolio/pages/view_all_screen.dart';
import 'package:portfolio/routes/app_pages.dart';
import 'package:portfolio/services/http_service.dart';
import 'package:portfolio/utility/constants.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<Category>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    categoriesFuture = HttpService.fetchCategories(); // ✅ Assign in initState
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100,
          leadingWidth: 100,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "GARV CHAPLOT",
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              ),
            ),
          ),
          actions: [
            MyTextButton(
              onPressed: () {
                if (Get.currentRoute != AppPages.HOME) {
                  Get.offNamed(AppPages.HOME);
                }
              },
              text: "Home",
            ),
            const SizedBox(width: 10),
            MyTextButton(
                onPressed: () {
                  if (Get.currentRoute != AppPages.GALLERY) {
                    Get.offNamed(AppPages.GALLERY);
                  }
                },
                text: "Gallery"),
            const SizedBox(width: 10),
            MyTextButton(
                onPressed: () {
                  if (Get.currentRoute != AppPages.ABOUT) {
                    Get.offNamed(AppPages.ABOUT);
                  }
                },
                text: "Contact"),
            const SizedBox(width: 10),
          ],
        ),
        body: FutureBuilder<List<Category>>(
          future: categoriesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error loading categories"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No categories found"));
            }

            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategorySection(category: categories[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final Category category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: HttpService.fetchPhotosByCategory(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error loading photos");
        }

        final photos = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(category.name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: photos.length > 4 ? 4 : photos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showImagePopup(context, photos[index]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.network(
                        "$MAIN_URL${photos[index].image}",
                        width: 300,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () => Get.to(() => ViewAllScreen(category: category)),
              child: Text("View All"),
            ),
          ],
        );
      },
    );
  }

  void _showImagePopup(BuildContext context, Photo photo) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent, // Transparent background
        insetPadding: EdgeInsets.zero, // Remove default padding
        child: Stack(
          children: [
            // Blurred Background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: Container(
                color:
                    Colors.black.withOpacity(0.2), // Semi-transparent overlay
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            // Center Image and Details
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image in its original size
                  Image.network(
                    "$MAIN_URL${photo.image}",
                    fit: BoxFit.none, // Keeps original width & height
                  ),
                  SizedBox(height: 8), // Small gap between image and text
                  // Title & Description Section
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFB2C9AD), // Background color for text
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Take only required space
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          photo.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          photo.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
