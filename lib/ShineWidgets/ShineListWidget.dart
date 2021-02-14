part of shinebeyond;

class ShineListWidget extends StatefulWidget {
  final ListWidgetType listWidgetType;
  final Duration duration;

  ShineListWidget(
      {@required this.listWidgetType,
      this.duration = const Duration(milliseconds: 40)});

  @override
  _ShineListWidgetState createState() => _ShineListWidgetState();
}

class _ShineListWidgetState extends State<ShineListWidget> {
  Timer _timer;
  int _start = 1;
  bool isDoing = true;
  int adder = 200;

  Random random = new Random();

  void secondMainAnimator() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start < 2) {
          setState(() {
            timer.cancel();
            mainAnimator();
          });
        } else {
          setState(() {
            _start = _start - 2;
          });
        }
      },
    );
  }

  void mainAnimator() {
    _timer = new Timer.periodic(
      widget.duration,
      (Timer timer) {
        if (_start > MediaQuery.of(context).size.width / 1.4) {
          setState(() {
            timer.cancel();
            secondMainAnimator();
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
    _start = random.nextInt(100);
    adder = random.nextInt(100);
    if (widget.listWidgetType == ListWidgetType.mix ||
        widget.listWidgetType == ListWidgetType.rectangular) {
      mainAnimator();
    } else {
      mainAnimator();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.listWidgetType == ListWidgetType.box
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: _start.toDouble(),
            height: _start.toDouble(),
            alignment: Alignment.centerLeft,
            color: Colors.white,
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                widget.listWidgetType == ListWidgetType.mix
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      )
                    : SizedBox.shrink(),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: _start.toDouble(),
                        height: 20,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: _start.toDouble() + adder,
                        height: 25,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
