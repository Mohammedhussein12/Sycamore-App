import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class PatientLineGraph extends StatefulWidget {
  const PatientLineGraph({
    super.key,
    required this.bottomReservedSize,
    required this.leftReservedSize,
    required this.leftInterval,
    required this.bottomInterval,
    required this.aspectRatio,
  });

  final double bottomReservedSize;
  final double leftReservedSize;
  final double leftInterval;
  final double bottomInterval;
  final double aspectRatio;

  @override
  State<PatientLineGraph> createState() => _PatientLineGraphState();
}

class _PatientLineGraphState extends State<PatientLineGraph> {
  int spo2 = 0;
  List<double> spo2s = [0, 0, 0, 0, 0, 0]; // Initialize with six zeroes
  double maxSpo2 = 0;


  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchData(); // Initial fetch
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => fetchData()); // Periodic fetch every 1 second
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.245/'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          spo2 = data['spo2'];
          if (spo2s.length >= 6) {
            spo2s.removeAt(0);
          }
          spo2s.add(spo2.toDouble());

          // Calculate min, max, and average
          minSpo2 = spo2s.reduce((a, b) => a < b ? a : b);

          min = min<minSpo2 ? min:minSpo2;
          maxSpo2 = spo2s.reduce((a, b) => a > b ? a : b);
          max = max>maxSpo2 ? max:maxSpo2;
          avgSpo2 = spo2s.reduce((a, b) => a + b) / spo2s.length;
        });
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: true, drawHorizontalLine: true),
              titlesData: FlTitlesData(
                show: true,
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: widget.bottomReservedSize,
                    interval: widget.bottomInterval,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: widget.leftReservedSize,
                      interval: widget.leftInterval),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  barWidth: 2,
                  color: kPrimaryColor, // Ensure kPrimaryColor is defined
                  dotData: const FlDotData(show: false),
                  spots: [
                    for (int i = 0; i < spo2s.length; i++) FlSpot(i + 1, spo2s[i]),
                  ],
                ),
              ],
              minX: 1,
              maxX: 6,
              minY: 0,
              maxY: 100,
            ),
          ),
        ),
      ],
    );
  }
}


