import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class drawerScreen extends StatelessWidget {
  const drawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Text(
          "Drawer Ongoing",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
