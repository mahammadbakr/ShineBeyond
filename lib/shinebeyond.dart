library shinebeyond;

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

part "TypeOfList/shineListview.dart";
part "TypeOfList/shineGridview.dart";
part "TypeOfList/shineWidget.dart";
part './ShineWidgets/ShineGridWidget.dart';
part './ShineWidgets/ShineListWidget.dart';
part './Helper/GridWidgetType.dart';
part './Helper/ListWidgetType.dart';
part './Helper/ShineEnum.dart';



ShimmerDirection getDirection(ShineDirection currentDirection) {
  ShimmerDirection direction;
  switch (currentDirection) {
    case ShineDirection.ltr:
      direction = ShimmerDirection.ltr;
      break;
    case ShineDirection.rtl:
      direction = ShimmerDirection.rtl;
      break;
    default:
      direction = ShimmerDirection.ltr;
  }
  return direction;
}