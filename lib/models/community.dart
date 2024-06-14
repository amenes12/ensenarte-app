class Community {
  String name;
  String contact;
  String contactPhone;
  String address;
  String city;
  String imageUrl;

  Community({
    required this.name,
    required this.contact,
    required this.contactPhone,
    required this.address,
    required this.city,
    required this.imageUrl,
  });

  Community.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          contact: json['contact']! as String,
          contactPhone: json['contactPhone']! as String,
          address: json['address']! as String,
          city: json['city']! as String,
          imageUrl: json['imageUrl']! as String,
        );
  Map<String, Object?> toJson() {
    return {
      'name': name,
      'contact': contact,
      'contactPhone': contactPhone,
      'address': address,
      'city': city,
      'imageUrl': imageUrl,
    };
  }
}
