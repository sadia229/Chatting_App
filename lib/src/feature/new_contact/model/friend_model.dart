
final String tableUser = 'userList';

class UserFields {
  static final List<String> values = [
    id,
    name,
    email,
    phoneNumber,
    bd,
    createDate
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String phoneNumber = 'phoneNumber';
  static final String bd = 'bd';
  static final String createDate = 'createDate';
}

class UserInfo {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? bd;
  final DateTime? createDate;

  const UserInfo({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.bd,
    this.createDate,
  });

  UserInfo copy({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? bd,
    DateTime? createDate,
  }) =>
      UserInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        bd: bd ?? this.bd,
        createDate: createDate ?? this.createDate,
      );

  static UserInfo fromJson(Map<String, Object?> json) => UserInfo(
        id: json[UserFields.id] as int?,
        name: json[UserFields.name] as String,
        email: json[UserFields.email] as String,
        phoneNumber: json[UserFields.phoneNumber] as String,
        bd: json[UserFields.bd] as String,
        createDate: DateTime.parse(json[UserFields.createDate] as String),
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.name: name,
        UserFields.email: email,
        UserFields.phoneNumber: phoneNumber,
        UserFields.bd: bd,
        UserFields.createDate: createDate?.toIso8601String(),
      };
}
