class Note {
  int id;
  String name;
  String desc;
  String? imagePath;
  bool isPressed;


  Note({
    required this.id,
    required this.name,
    required this.desc,
    required this.imagePath,
    required this.isPressed
  });

  factory Note.fromJSON(Map<String, dynamic> data) {
    return Note(
        id: data['id'],
        name: data['name'],
        desc: data['description'],
        imagePath: data['image_path'],
        isPressed: false
    );
  }
}