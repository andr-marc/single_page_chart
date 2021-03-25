import 'package:charts_flutter/flutter.dart' as charts;

class Brand {
  final String month;
  final int sales;
  final charts.Color barColor;

  Brand(this.month, this.sales, this.barColor);
}
