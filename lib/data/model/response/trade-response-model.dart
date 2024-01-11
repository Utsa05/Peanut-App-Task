class TradeReponseModel {
  final double currentPrice;
  final dynamic comment;
  final int digits;
  final int login;
  final double openPrice;
  final DateTime openTime;
  final double profit;
  final double sl;
  final double swaps;
  final String symbol;
  final int tp;
  final int ticket;
  final int type;
  final double volume;

  TradeReponseModel({
    required this.currentPrice,
    required this.comment,
    required this.digits,
    required this.login,
    required this.openPrice,
    required this.openTime,
    required this.profit,
    required this.sl,
    required this.swaps,
    required this.symbol,
    required this.tp,
    required this.ticket,
    required this.type,
    required this.volume,
  });

  factory TradeReponseModel.fromJson(Map<String, dynamic> json) =>
      TradeReponseModel(
        currentPrice: json["currentPrice"]?.toDouble() ?? 0.0,
        comment: json["comment"] ?? "",
        digits: json["digits"] ?? 0,
        login: json["login"] ?? 0,
        openPrice: json["openPrice"]?.toDouble() ?? 0.0,
        openTime: DateTime.parse(json["openTime"]),
        profit: json["profit"]?.toDouble() ?? 0.0,
        sl: json["sl"]?.toDouble() ?? 0.0,
        swaps: json["swaps"]?.toDouble() ?? 0.0,
        symbol: json["symbol"] ?? "",
        tp: (json["tp"] as num?)?.toInt() ?? 0,
        ticket: json["ticket"] ?? 0,
        type: json["type"] ?? 0,
        volume: json["volume"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "currentPrice": currentPrice,
        "comment": comment,
        "digits": digits,
        "login": login,
        "openPrice": openPrice,
        "openTime": openTime.toIso8601String(),
        "profit": profit,
        "sl": sl,
        "swaps": swaps,
        "symbol": symbol,
        "tp": tp,
        "ticket": ticket,
        "type": type,
        "volume": volume,
      };
}
