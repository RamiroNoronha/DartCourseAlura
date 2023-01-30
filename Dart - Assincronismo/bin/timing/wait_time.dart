class BotClock {
  static Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  static Stream kakoBotStream(int interval, int maxTime) async* {
    for (int i = 1; i <= maxTime; i++) {
      await Future.delayed(Duration(seconds: interval));
      yield i;
    }
  }
}
