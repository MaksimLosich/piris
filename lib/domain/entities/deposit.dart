class Deposit {
  bool revokable;
  int term;
  int termRemains;
  String number;
  int currency;
  DateTime start;
  DateTime end;
  double summ;
  double percent;
  String userId;
  bool isClosed;

  String accountId;
  String accountId2;

  Deposit({
    required this.revokable,
    required this.term,
    required this.termRemains,
    required this.number,
    required this.currency,
    required this.start,
    required this.end,
    required this.summ,
    required this.percent,
    required this.userId,
    required this.accountId,
    required this.accountId2,
    required this.isClosed,
  });

  static Deposit fromJson(Map<String, dynamic> json) {
    return Deposit(
      revokable: json['revokable'],
      termRemains: json['termRemains'],
      term: json['term'],
      number: json['number'],
      currency: json['currency'],
      start: DateTime.parse(json['start']),
      end: DateTime.parse(json['end']),
      summ: json['summ'],
      percent: json['percent'],
      userId: json['userId'],
      accountId: json['accountId'],
      accountId2: json['accountId2'],
      isClosed: json['isClosed'],
    );
  }

  Map<String, dynamic> toJson() => {
    'revokable': revokable,
    'term': term,
    'termRemains': termRemains,
    'number': number,
    'currency': currency,
    'start': start.toString(),
    'end': end.toString(),
    'summ': summ,
    'percent': percent,
    'userId': userId,
    'accountId': accountId,
    'accountId2': accountId2,
    'isClosed': isClosed,
  };
}
