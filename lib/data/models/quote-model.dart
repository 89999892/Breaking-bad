class Quote {
  int quoteId;
  String quote;

  Quote({this.quoteId, this.quote});

  Quote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quote_id'];
    quote = json['quote'];

  }

}