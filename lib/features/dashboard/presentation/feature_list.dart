import 'package:bytebank/features/dashboard/presentation/feature_list_item.dart';
import 'package:flutter/widgets.dart';

const double CONTEINER_HEIGHT = 120;

class FeatureList extends StatefulWidget {
  FeatureList({List<FeatureItem> items}) {
    this._items = items;
  }

  List<FeatureItem> _items;

  @override
  _FeatureListState createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  @override
  Widget build(BuildContext context) => Container(
        height: CONTEINER_HEIGHT,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget._items,
        ),
      );
}

