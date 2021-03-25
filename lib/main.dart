import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'components/brand.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    startChart();
  }

  // initial dropdown setting
  String dropdown1Value = items_category[0];
  String dropdown2Value = products_clothing[0];
  String dropdown3Value = brands_shirts.keys.toList()[0];

  // chart data
  var data = <Brand>[];
  List<charts.Series<Brand, String>> series;

  // categories
  static const List<String> items_category = ['Clothing', 'Food', 'Book'];

  // products
  static const List<String> products_clothing = ['Shirts', 'Skirts', 'Hats'];
  static const List<String> products_food = ['Fruits', 'Pastas', 'Vegans'];
  static const List<String> products_book = ['Mystery', 'Sci-fi', 'Horror'];

  // brands
  static const Map<String, Map<String, int>> brands_shirts = {
    'Shirt 1': {"January": 120, "February": 231, "March": 521, "April": 152},
    'Shirt 2': {"January": 225, "February": 124, "March": 445, "April": 324},
    'Shirt 3': {"January": 348, "February": 456, "March": 654, "April": 448}
  };
  static const Map<String, Map<String, int>> brands_skirts = {
    'Skirt 1': {"January": 546, "February": 231, "March": 231, "April": 231},
    'Skirt 2': {"January": 120, "February": 453, "March": 834, "April": 452},
    'Skirt 3': {"January": 533, "February": 231, "March": 486, "April": 56}
  };
  static const Map<String, Map<String, int>> brands_hats = {
    'Hat 1': {"January": 35, "February": 231, "March": 22, "April": 333},
    'Hats 2': {"January": 531, "February": 886, "March": 573, "April": 358},
    'Hats 3': {"January": 120, "February": 231, "March": 231, "April": 231}
  };
  static const Map<String, Map<String, int>> brands_fruits = {
    'Fruit 1': {"January": 345, "February": 233, "March": 531, "April": 531},
    'Fruit 2': {"January": 120, "February": 231, "March": 231, "April": 231},
    'Fruit 3': {"January": 120, "February": 231, "March": 231, "April": 231}
  };
  static const Map<String, Map<String, int>> brands_pastas = {
    'Pasta 1': {"January": 538, "February": 444, "March": 568, "April": 65},
    'Pasta 2': {"January": 985, "February": 875, "March": 576, "April": 885},
    'Pasta 3': {"January": 976, "February": 789, "March": 896, "April": 784}
  };
  static const Map<String, Map<String, int>> brands_vegans = {
    'Vegan 1': {"January": 889, "February": 467, "March": 856, "April": 864},
    'Vegan 2': {"January": 56, "February": 231, "March": 321, "April": 231},
    'Vegan 3': {"January": 35, "February": 531, "March": 352, "April": 531}
  };
  static const Map<String, Map<String, int>> brands_mystery = {
    'Mystery 1': {"January": 120, "February": 231, "March": 235, "April": 231},
    'Mystery 2': {"January": 120, "February": 231, "March": 153, "April": 583},
    'Mystery 3': {"January": 120, "February": 153, "March": 253, "April": 231}
  };
  static const Map<String, Map<String, int>> brands_scifi = {
    'Sci-fi 1': {"January": 97, "February": 231, "March": 231, "April": 231},
    'Sci-fi 2': {"January": 586, "February": 356, "March": 654, "April": 887},
    'Sci-fi 3': {"January": 158, "February": 513, "March": 458, "April": 864}
  };
  static const Map<String, Map<String, int>> brands_horror = {
    'Horror 1': {"January": 64, "February": 853, "March": 258, "April": 951},
    'Horror 2': {"January": 753, "February": 852, "March": 741, "April": 963},
    'Horror 3': {"January": 456, "February": 466, "March": 369, "April": 358}
  };

  // get products based on selected category
  getProducts() {
    if (dropdown1Value == items_category[0]) {
      return [...products_clothing];
    } else if (dropdown1Value == items_category[1]) {
      return [...products_food];
    } else {
      return [...products_book];
    }
  }

  // get brands based on selected product
  getBrands() {
    if (dropdown2Value == products_clothing[0]) {
      return [...brands_shirts.keys.toList()];
    } else if (dropdown2Value == products_clothing[1]) {
      return [...brands_skirts.keys.toList()];
    } else if (dropdown2Value == products_clothing[2]) {
      return [...brands_hats.keys.toList()];
    } else if (dropdown2Value == products_food[0]) {
      return [...brands_fruits.keys.toList()];
    } else if (dropdown2Value == products_food[1]) {
      return [...brands_pastas.keys.toList()];
    } else if (dropdown2Value == products_food[2]) {
      return [...brands_vegans.keys.toList()];
    } else if (dropdown2Value == products_book[0]) {
      return [...brands_mystery.keys.toList()];
    } else if (dropdown2Value == products_book[1]) {
      return [...brands_scifi.keys.toList()];
    } else {
      return [...brands_horror.keys.toList()];
    }
  }

  startChart() {
    String id;
    brands_shirts.values.toList()[0].forEach((key, value) {
      String month = key;
      int sales = value;

      data.add(
        Brand(
          month,
          sales,
          charts.ColorUtil.fromDartColor(Colors.blue),
        ),
      );

      id = brands_shirts.keys.toList()[0];

      series = [
        charts.Series(
            id: id,
            data: data,
            domainFn: (Brand series, _) => series.month,
            measureFn: (Brand series, _) => series.sales,
            colorFn: (Brand series, _) => series.barColor)
      ];
    });
  }

  updateChart() {
    String id;
    if (dropdown3Value == brands_shirts.keys.toList()[0]) {
      print(brands_shirts.values.toList()[0]);
      brands_shirts.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_shirts.keys.toList()[1]) {
      brands_shirts.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_shirts.keys.toList()[2]) {
      brands_shirts.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_skirts.keys.toList()[0]) {
      brands_skirts.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_skirts.keys.toList()[1]) {
      brands_skirts.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_skirts.keys.toList()[2]) {
      brands_skirts.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_hats.keys.toList()[0]) {
      brands_hats.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_hats.keys.toList()[1]) {
      brands_hats.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_hats.keys.toList()[2]) {
      brands_hats.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_fruits.keys.toList()[0]) {
      brands_fruits.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_fruits.keys.toList()[1]) {
      brands_fruits.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_fruits.keys.toList()[2]) {
      brands_fruits.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_pastas.keys.toList()[0]) {
      brands_pastas.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_pastas.keys.toList()[1]) {
      brands_pastas.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_pastas.keys.toList()[2]) {
      brands_pastas.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_vegans.keys.toList()[0]) {
      brands_vegans.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_vegans.keys.toList()[1]) {
      brands_vegans.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_vegans.keys.toList()[2]) {
      brands_vegans.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_mystery.keys.toList()[0]) {
      brands_mystery.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_mystery.keys.toList()[1]) {
      brands_mystery.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_mystery.keys.toList()[2]) {
      brands_mystery.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_scifi.keys.toList()[0]) {
      brands_scifi.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_scifi.keys.toList()[1]) {
      brands_scifi.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_scifi.keys.toList()[2]) {
      brands_scifi.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_horror.keys.toList()[0]) {
      brands_horror.values.toList()[0].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_horror.keys.toList()[1]) {
      brands_horror.values.toList()[1].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    } else if (dropdown3Value == brands_horror.keys.toList()[2]) {
      brands_horror.values.toList()[2].forEach((key, value) {
        String month = key;
        int sales = value;

        data.add(
          Brand(
            month,
            sales,
            charts.ColorUtil.fromDartColor(Colors.blue),
          ),
        );
      });
    }

    id = brands_shirts.keys.toList()[0];

    series = [
      charts.Series(
          id: id,
          data: data,
          domainFn: (Brand series, _) => series.month,
          measureFn: (Brand series, _) => series.sales,
          colorFn: (Brand series, _) => series.barColor)
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: size.width * 0.3,
        leading: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: kToolbarHeight,
                child: Text(
                  "Menu",
                ),
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                height: kToolbarHeight,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("User Name"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        title: Text("Sales Report"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Dropdown aqui
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Category: '),
                        DropdownButton<String>(
                          value: dropdown1Value,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdown1Value = newValue;
                              // the products dropdown button will update based on the selected category
                              if (newValue == items_category[0]) {
                                dropdown2Value = products_clothing[0];
                                dropdown3Value = brands_shirts.keys.toList()[0];
                              } else if (newValue == items_category[1]) {
                                dropdown2Value = products_food[0];
                                dropdown3Value = brands_fruits.keys.toList()[0];
                              } else {
                                dropdown2Value = products_book[0];
                                dropdown3Value =
                                    brands_mystery.keys.toList()[0];
                              }
                              updateChart();
                            });
                          },
                          items: [...items_category]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Product: '),
                        DropdownButton<String>(
                          value: dropdown2Value,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdown2Value = newValue;
                              // the brands dropdown button will update based on the selected product
                              if (newValue == products_clothing[0]) {
                                dropdown3Value = brands_shirts.keys.toList()[0];
                              } else if (newValue == products_clothing[1]) {
                                dropdown3Value = brands_skirts.keys.toList()[0];
                              } else if (newValue == products_clothing[2]) {
                                dropdown3Value = brands_hats.keys.toList()[0];
                              } else if (newValue == products_food[0]) {
                                dropdown3Value = brands_fruits.keys.toList()[0];
                              } else if (newValue == products_food[1]) {
                                dropdown3Value = brands_pastas.keys.toList()[0];
                              } else if (newValue == products_food[2]) {
                                dropdown3Value = brands_vegans.keys.toList()[0];
                              } else if (newValue == products_book[0]) {
                                dropdown3Value =
                                    brands_mystery.keys.toList()[0];
                              } else if (newValue == products_book[1]) {
                                dropdown3Value = brands_scifi.keys.toList()[0];
                              } else {
                                dropdown3Value = brands_horror.keys.toList()[0];
                              }
                              updateChart();
                            });
                          },
                          items: getProducts()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text('Brand: '),
                        DropdownButton<String>(
                          value: dropdown3Value,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdown3Value = newValue;
                              updateChart();
                            });
                          },
                          items: getBrands()
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // grafico de barras aqui
              Text('Sales by Month for'),
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
