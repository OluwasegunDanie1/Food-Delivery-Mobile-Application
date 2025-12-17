class CardInfo {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  CardInfo({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  Map<String, dynamic> toJson() => {
    "cardNumber": cardNumber,
    "cardHolderName": cardHolderName,
    "expiryDate": expiryDate,
    "cvv": cvvCode,
  };

  factory CardInfo.fromJson(Map<String, dynamic> json) => CardInfo(
    cardNumber: json["cardNumber"],
    cardHolderName: json["cardHolderName"],
    expiryDate: json["expiryDate"],
    cvvCode: json["cvvCode"],
  );
}
