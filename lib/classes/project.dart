class Project {
  int id;
  String name;
  String link;
  String imagePath;
  String description;
  String publishedAt;

  Project({
    required this.id,
    required this.name,
    required this.link,
    required this.imagePath,
    required this.description,
    required this.publishedAt
  });
  
  factory Project.fromJSON(Map<String, dynamic> data) {
    return Project(
        id: data['id'],
        name: data['name'],
        link: data['link'],
        imagePath: data['pc_image_path'],
        description: data['description'],
        publishedAt: data['published_at']
    );
  }
}