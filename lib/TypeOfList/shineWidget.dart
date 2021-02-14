part of shinebeyond;


class SkeletonWidgetLoader extends StatefulWidget {
  /// Number of skeleton items to show
  final int items;

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

  // final bool isLoading;

  const SkeletonWidgetLoader({
    Key key,
    @required this.items,
    @required this.child,
    this.itemsPerRow = 2,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.direction = ShineDirection.ltr,
    this.period = const Duration(seconds: 2),
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
  }) : super(key: key);

  @override
  _SkeletonWidgetLoaderState createState() => _SkeletonWidgetLoaderState();
}

class _SkeletonWidgetLoaderState extends State<SkeletonWidgetLoader> {

  bool isLoading=true;


  @override
  Widget build(BuildContext context) {
    ShimmerDirection direction = getDirection(widget.direction);

    // GridView.builder(
    //   itemBuilder: (ctx, i) {
    //     StateCapital sc = _myItemsList[i];
    //     return Card(
    //       child: GridTile(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Text(sc.name),
    //             Text(sc.capital),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    //   itemCount: _myItemsList.length,
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 3,
    //   ),
    // ),






    return isLoading ? Column(
      children: [
        Shimmer.fromColors(
          baseColor: widget.baseColor,
          highlightColor: widget.highlightColor,
          direction: direction,
          period: widget.period,
          enabled: true,
          child:  widget.child,
        ),
      ],
    ) :widget.child;
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
