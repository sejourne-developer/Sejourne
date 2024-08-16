/// Model class representing user data
class UserModel {
  // keep those values finale which you do not want to update_personal_info
  final int id;
  final String? email;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? number;
  final String? image;
  final String? emailVerifyStatus;

  /// Constructor for UserModel
  UserModel({
    required this.id,
    this.email,
    this.userName,
    this.firstName,
    this.lastName,
    this.fullName,
    this.number,
    this.image,
    this.emailVerifyStatus,
  });

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(
        id: -1,
        email: "",
        userName: "",
        firstName: "",
        lastName: "",
        fullName: "",
        number: "",
        image: "",
        emailVerifyStatus: "",
      );

  /// Factory method to create a UserModel from a firebase snapshot
  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return UserModel(
        id: json["id"],
        email: json['email'].toString(),
        userName: json['username'].toString(),
        firstName: json['first_name'].toString(),
        lastName: json['last_name'].toString(),
        fullName: json['full_name'].toString(),
        number: json['number'].toString(),
        image: json['image'].toString(),
        emailVerifyStatus: json['email_verify_status'].toString(),
      );
    }
    return UserModel.empty();
  }
}
