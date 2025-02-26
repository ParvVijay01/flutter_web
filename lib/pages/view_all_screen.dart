import 'package:flutter/material.dart';
import 'package:portfolio/model/category_model.dart';
import 'package:portfolio/model/photo_model.dart';
import 'package:portfolio/services/http_service.dart';


class ViewAllScreen extends StatelessWidget {
  final Category category;

  const ViewAllScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: FutureBuilder<List<Photo>>(
        future: HttpService.fetchPhotosByCategory(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading photos"));
          }

          final photos = snapshot.data!;
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _showImagePopup(context, photos[index]),
                child: Image.network(photos[index].image, fit: BoxFit.cover),
              );
            },
          );
        },
      ),
    );
  }

  void _showImagePopup(BuildContext context, Photo photo) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(photo.image),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(photo.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
