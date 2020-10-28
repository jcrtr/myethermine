import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'package:intl/intl.dart';

class MinerChart extends StatelessWidget {

  Widget sample4(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 5.5,
        // width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          selectedValue: 1,
          xAxisCustomValues: [1, 5, 10, 15, 20, 25, 30, 35, 40],
          series: const [
            BezierLine(
              label: "june",
              lineColor: Colors.orange,
              dataPointStrokeColor: Colors.white,
              dataPointFillColor: Colors.orange,
              lineStrokeWidth: 3,
              data: const [
                DataPoint<double>(value: 100, xAxis: 1),
                DataPoint<double>(value: 130, xAxis: 5),
                DataPoint<double>(value: 300, xAxis: 10),
                DataPoint<double>(value: 150, xAxis: 15),
                DataPoint<double>(value: 100, xAxis: 20),
                DataPoint<double>(value: 100, xAxis: 25),
                DataPoint<double>(value: 250, xAxis: 30),
                DataPoint<double>(value: 250, xAxis: 35),
                DataPoint<double>(value: 250, xAxis: 40),
              ],
            ),
          ],
          config: BezierChartConfig(
            startYAxisFromNonZeroValue: true,
            verticalIndicatorFixedPosition: false,
            bubbleIndicatorColor: Colors.white,
            bubbleIndicatorLabelStyle:
            TextStyle(color: Colors.black),
            bubbleIndicatorTitleStyle:
            TextStyle(color: Colors.black),
            bubbleIndicatorValueStyle:
            TextStyle(color: Colors.black),
            footerHeight: 40,
            displayYAxis: false,
            stepsYAxis: 15,
            displayLinesXAxis: false,
            xAxisTextStyle: TextStyle(
              color: Colors.black,
            ),
            // backgroundGradient: Colors.white,
            snap: false,
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: sample4(context),
    );
  }
}
