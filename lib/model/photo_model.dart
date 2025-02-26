class Photo {
  final String id;
  final String title;
  final String image;
  final String category; // Now stored as a String instead of a Map
  final String description;
  final String createdAt;

  Photo({
    required this.id,
    required this.title,
    required this.image,
    required this.category, // Keep it as a String
    required this.description,
    required this.createdAt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
      category: json['category'].toString(), // Ensure it's always a String
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }
}
