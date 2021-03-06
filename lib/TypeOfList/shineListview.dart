part of shinebeyond;


class ShineListLoader extends StatefulWidget {
  /// Number of skeleton items to show
  /// Default is 1
  final int items;

  /// A layout of how you want your skeleton to look like
  final Widget child;

  /// Base Color of the skeleton list item
  /// Defaults to Colors.grey[300]
  final Color baseColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to Colors.grey[100]
  final Color highlightColor;

  /// Highlight Color of the skeleton list item
  /// Defaults to ShimmerDirection.rtl
  final ShineDirection direction;

  /// Duration in which the transition takes place
  /// Defaults to Duration(seconds: 2)
  final Duration period;

  const ShineListLoader({
    Key key,
    this.items = 1,
    @required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.direction = ShineDirection.ltr,
    this.period = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _ShineListLoaderState createState() => _ShineListLoaderState();
}

class _ShineListLoaderState extends State<ShineListLoader> {
  @override
  Widget build(BuildContext context) {
    ShimmerDirection direction = getDirection(widget.direction);

    return Directionality(
      textDirection: widget.direction==ShineDirection.rtl ? TextDirection.rtl:TextDirection.ltr,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: widget.baseColor,
            highlightColor: widget.highlightColor,
            direction: direction,
            period: widget.period,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Container(
                child: widget.child,
              ),
              itemCount: widget.items,
            ),
          ),
        ],
      ),
    );
  }
}