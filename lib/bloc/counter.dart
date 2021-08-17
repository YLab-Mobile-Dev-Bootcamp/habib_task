import 'dart:async';

class CounterBloc {
  int _counter = 0;

  StreamController _inputController = StreamController();
  StreamSink get tombol => _inputController.sink;

  StreamController _outputController = StreamController();
  StreamSink get _sinkout => _outputController.sink;

  Stream get output => _outputController.stream;

  CounterBloc() {
    _inputController.stream.listen((event) {
      if (event == 'add') {
        _counter++;
      }

      _sinkout.add(_counter);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
