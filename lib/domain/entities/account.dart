class Account {
  num sum;
  String id;

  String userId;

  Account({
    required this.sum,
    required this.id,
    required this.userId,
  });

  static Account fromJson(Map<String, dynamic> json) {
    return Account(
      sum: json['sum'],
      id: json['id'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'sum': sum,
    'id': id,
    'userId': userId,
  };
}
