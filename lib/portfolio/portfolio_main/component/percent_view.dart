import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentView extends StatelessWidget {
  final double percent;

  const PercentView({
    required this.percent,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percents= percent>1? 1 : percent;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width/123*(percents*100)),
            Icon(Icons.run_circle,size: 50.r,color: Colors.blue,),
          ],
        ),
        LinearPercentIndicator(
          barRadius: Radius.circular(20),
          percent: percents,
          animation: true,
          center: Text("${(percents*100).toStringAsFixed(2)}%"),
          animationDuration:1400,
          progressColor: Colors.blue,
          lineHeight: 15.h,
        ),
      ],
    );
  }
}
