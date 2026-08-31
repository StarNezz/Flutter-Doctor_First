class UserModel {
  final int id;
  final String name;
  final String email;
  final int age;
  final String? phoneNumber;
  final String? address;
  final bool isActive;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    this.phoneNumber,
    this.address,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Nama tidak tersedia',
      email: json['email'] as String? ?? 'Email tidak tersedia',
      age: json['age'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      isActive: json['is_active'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'phone_number': phoneNumber,
      'address': address,
      'is_active': isActive,
    };
  }
}
