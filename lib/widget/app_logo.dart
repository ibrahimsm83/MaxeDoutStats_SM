import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/index_utils.dart';


class AppLogoIcon extends StatelessWidget {
  const AppLogoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Image.asset(
                      AppAssets.innerApplogo,
                      height: 76,
                      width: MediaQuery.of(context).size.width * 0.676,
                    );
    // SizedBox(
    //   height: sizeHeight(context) * 0.18,
    //   width: sizeWidth(context) * 0.18,
    //   child: Image.asset(AppAssets.innerApplogo),
    // );
  }
}
