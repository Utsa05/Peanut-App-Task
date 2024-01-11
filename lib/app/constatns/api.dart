String baseUrl = "https://peanut.ifxdb.com/api/ClientCabinetBasic";

class API {
  static String loginUrl = "$baseUrl/IsAccountCredentialsCorrect";
  static String accountInfoUrl = "$baseUrl/GetAccountInformation";
  static String fourPhoneNoUrl = "$baseUrl/GetLastFourNumbersPhone";
  static String tradeUrl = "$baseUrl/GetOpenTrades";
}
