
class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;


Contact(
  {
    required this.id,
    required this.name,
    required this.phone,
    required this.email});

  Factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}