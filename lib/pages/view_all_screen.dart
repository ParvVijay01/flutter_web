import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/model/category_model.dart';
import 'package:portfolio/model/photo_model.dart';
import 'package:portfolio/services/http_service.dart';
import 'package:portfolio/utility/constants.dart'; // Import where MAIN_URL is defined

class ViewAllScreen extends StatelessWidget {
  final Category category;

  const ViewAllScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        category.name,
        style: TextStyle(color: Colors.white),
      )),
      body: FutureBuilder<List<Photo>>(
        future: HttpService.fetchPhotosByCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading photos"));
          }

          final photos = snapshot.data ?? [];

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 1000
                  ? 4
                  : screenWidth > 600
                      ? 3
                      : 2, // Responsive grid
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              String imageUrl =
                  "$MAIN_URL${photos[index].image}"; // Fix image path

              return GestureDetector(
                onTap: () => _showImagePopup(context, photos[index], imageUrl),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, color: Colors.red),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showImagePopup(BuildContext context, Photo photo, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent, // Transparent background
        insetPadding: EdgeInsets.all(15), // Remove default padding
        child: SingleChildScrollView(
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
              // Close Button
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              // Center Image and Details
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Image Container with Constraints
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                        maxHeight: MediaQuery.of(context).size.height * 0.8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 8), // Small gap between image and text
                    // Title & Description Section
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFFB2C9AD), // Background color for text
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
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
      ),
    );
  }
}
