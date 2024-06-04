class Community {
  String name;
  String contact;
  String contactPhone;
  String location;
  String imageUrl;

  Community({
    required this.name,
    required this.contact,
    required this.contactPhone,
    required this.location,
    required this.imageUrl,
  });

  Community.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          contact: json['contact']! as String,
          contactPhone: json['contactPhone']! as String,
          location: json['location']! as String,
          imageUrl: json['imageUrl']! as String,
        );
  Map<String, Object?> toJson() {
    return {
      'name': name,
      'contact': contact,
      'contactPhone': contactPhone,
      'location': location,
      'imageUrl': imageUrl,
    };
  }
}
