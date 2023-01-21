class SendIdNotInvalidException implements Exception {
  String senderId;

  SendIdNotInvalidException({required this.senderId});
}

class ReceiverIdInvalidException implements Exception {
  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});
}

class SenderNotAuthenticatedException implements Exception {
  String senderId;
  SenderNotAuthenticatedException({required this.senderId});
}

class SenderBalanceLowerThenException implements Exception {
  String senderId;
  double senderBalance;
  double amount;
  SenderBalanceLowerThenException(
      {required this.senderId,
      required this.senderBalance,
      required this.amount});
}
