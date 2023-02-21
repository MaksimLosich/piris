class Found {
  double summ;

  Found(this.summ);

  static Found fromJson(Map<String, dynamic> json) {
    return Found(
      json['summ'],
    );
  }

  Map<String, dynamic> toJson() => {
    'summ': summ,
  };
}