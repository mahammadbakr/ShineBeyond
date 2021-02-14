part of shinebeyond;

class ShineGridWidget extends StatefulWidget {
  final int itemCount;
  final GridWidgetType gridWidgetType;
  final Duration duration;

  ShineGridWidget({
    @required this.itemCount,
    @required this.gridWidgetType,
    this.duration = const Duration(milliseconds: 40)
  });

  @override
  _ShineGridWidgetState createState() => _ShineGridWidgetState();
}

class _ShineGridWidgetState extends State<ShineGridWidget> {
  Timer _timer;
  int _start = 1;
  bool isDoing = true;

  void secondOnceIncreaser() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start < 2) {
          setState(() {
            timer.cancel();
            onceIncreaser();
          });
        } else {
          setState(() {
            _start = _start - 2;
          });
        }
      },
    );
  }

  void onceIncreaser() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start >
            MediaQuery.of(context).size.width / widget.itemCount + 40) {
          setState(() {
            timer.cancel();
            secondOnceIncreaser();
          });
        } else {
          setState(() {
            _start = _start + 2;
          });
        }
      },
    );
  }

  void secondTweenIncreaser() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start < 2) {
          setState(() {
            timer.cancel();
            tweenIncreaser();
          });
        } else {
          setState(() {
            _start = _start - 2;
          });
        }
      },
    );
  }

  void tweenIncreaser() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start >
            MediaQuery.of(context).size.width / widget.itemCount.toInt() + 40) {
          setState(() {
            timer.cancel();
            secondTweenIncreaser();
          });
        } else {
          setState(() {
            _start = _start + 2;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.gridWidgetType == GridWidgetType.tween) {
      tweenIncreaser();
    } else {
      onceIncreaser();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: GridTile(
        child: widget.gridWidgetType == GridWidgetType.tween
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: _start.toDouble(),
                      height: MediaQuery.of(context).size.height / 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: _start.toDouble(),
                      height: MediaQuery.of(context).size.height / 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.gridWidgetType == GridWidgetType.rotation
                      ? Transform.rotate(
                          angle: _start.toDouble() / widget.itemCount,
                          child: Container(
                            margin: EdgeInsets.all(4),
                            width: _start.toDouble(),
                            height: _start.toDouble(),
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.all(4),
                          width: _start.toDouble(),
                          height: _start.toDouble(),
                          color: Colors.white,
                        ),
                ],
              ),
      ),
    );
  }
}
