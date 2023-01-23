class SendIdInvalidException implements Exception {
  String senderId;
  static const String report = 'SendIdInvalidException';
  SendIdInvalidException({required this.senderId});

  @override
  String toString() {
    return '$report\nID Sender: $senderId';
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = 'ReceiverIdInvalidException';

  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString() {
    return '$report\nID Receiver: $idReceiver';
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = 'SenderNotAuthenticatedException';

  String senderId;
  SenderNotAuthenticatedException({required this.senderId});

  @override
  String toString() {
    return '$report\nID Sender: $senderId';
  }
}

class SenderBalanceLowerThenException implements Exception {
  static const String report = 'SenderBalanceLowerThenException';

  String senderId;
  double senderBalance;
  double amount;
  SenderBalanceLowerThenException(
      {required this.senderId,
      required this.senderBalance,
      required this.amount});

  @override
  String toString() {
    return '$report\nID Sender: $senderId\nSender Balance: $senderBalance\nAmount: $amount';
  }
}

class ReceiverNotAuthenticatedException implements Exception {
  static const String report = "ReceiverNotAuthenticatedException";
  String idReceiver;
  ReceiverNotAuthenticatedException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nID Receiver: $idReceiver";
  }
}
