import 'package:flutter/material.dart';
import 'package:maxedoutstats/utils/app_colors.dart';
import 'package:sizer/sizer.dart';



class ProgramsCategory extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<String>? name;

  const ProgramsCategory({Key? key, this.selected, this.callback, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate( name!.length, (index) => Flexible(
            child: GestureDetector(
                  onTap: () => callback!(index),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 3.0,
                        right: 3.0,
                        top: 25,
                        bottom: 25),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: selected == index ? AppColors.primary : AppColors.blackColor,
                        borderRadius: BorderRadius.circular(40),
                        ),
                    child: Center(
                      child: Text(
                           name![index],
                            style: TextStyle(
                              fontSize: 9.sp,
                                color:
                                  Colors.white ),
                          ),
                    ),
                  ),
                ),
          ))
        )
       
      ),
    );
  }
}
