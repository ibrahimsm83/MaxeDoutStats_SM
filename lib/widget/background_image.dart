import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';

class BackgroundImage extends StatelessWidget {
  Widget? child;
  BackgroundImage({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.splashbgImage), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
