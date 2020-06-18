import 'package:bytebank/ui/resources/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double FEATURE_ITEM_HEIGHT = 150;

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  FeatureItem(
    this.name,
    this.icon, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(app_8),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(app_8),
            width: FEATURE_ITEM_HEIGHT,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: app_24,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: app_16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
