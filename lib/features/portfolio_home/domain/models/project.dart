class Project {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final List<String> tags;
  final String category;
  final String imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final bool featured;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.tags,
    required this.category,
    required this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.featured = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      longDescription: json['longDescription'] as String,
      tags: List<String>.from(json['tags'] as List),
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      githubUrl: json['githubUrl'] as String?,
      liveUrl: json['liveUrl'] as String?,
      featured: json['featured'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'longDescription': longDescription,
      'tags': tags,
      'category': category,
      'imageUrl': imageUrl,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'featured': featured,
    };
  }
}
