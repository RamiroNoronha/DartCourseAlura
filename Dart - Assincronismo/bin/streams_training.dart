import 'dart:io';
import 'dart:math';

void main() async {
  //First application
  // var stream = countStream(1, 10);
  // var sum = await sumStream(stream);
  // print(sum);

  //Second application
  // var stream = countStream(1, 10).listen((event) {
  //   print('time: $event');
  // });

  //Third application
  var stream = countStream(1, 10);
  var result = await stream.lastWhere((element) {
    print('elemento $element');
    return element % 4 == 0;
  }, orElse: (() => -1));
  print(result);
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int interval, int to) async* {
  for (int i = 1; i <= to; i++) {
    await Future.delayed(Duration(seconds: interval));
    print('time: $i');
    yield i;
  }
}
