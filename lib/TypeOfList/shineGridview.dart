part of shinebeyond;

class ShineGridLoader extends StatefulWidget {
  /// Number of skeleton items to show
  final int itemCount;

  /// A layout of how you want your skeleton to look like
  final Widget child;

  /// Number of skeleton items to show
  /// Default is 2
  final int itemsPerRow;

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

  /// Spacing between items on the cross axis
  /// Defaults to 10
  final double crossAxisSpacing;

  /// Spacing between items on the main axis
  /// Defaults to 10
  final double mainAxisSpacing;

  final bool shrinkWrap;

  // final bool isLoading;

  const ShineGridLoader({
    Key key,
    @required this.itemCount,
    @required this.child,
    this.itemsPerRow = 2,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.direction = ShineDirection.ltr,
    this.shrinkWrap = true,
    this.period = const Duration(seconds: 2),
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
  }) : super(key: key);

  @override
  _ShineGridLoaderState createState() => _ShineGridLoaderState();
}

class _ShineGridLoaderState extends State<ShineGridLoader> {


  @override
  Widget build(BuildContext context) {
    ShimmerDirection direction = getDirection(widget.direction);
    return   Directionality(
      textDirection: widget.direction==ShineDirection.rtl ? TextDirection.rtl:TextDirection.ltr,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: widget.baseColor,
            highlightColor: widget.highlightColor,
            direction: direction,
            period: widget.period,
            child: GridView.builder(
              shrinkWrap: widget.shrinkWrap,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, __) => Container(
                child: widget.child,
              ),
              itemCount: widget.itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.itemsPerRow,
                crossAxisSpacing: widget.crossAxisSpacing,
                mainAxisSpacing: widget.mainAxisSpacing,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
