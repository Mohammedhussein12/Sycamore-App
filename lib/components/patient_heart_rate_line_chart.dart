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

class PatientHeartRateLineChart extends StatefulWidget {
  const PatientHeartRateLineChart({super.key});

  @override
  State<PatientHeartRateLineChart> createState() => _PatientHeartRateLineChartState();
}

class _PatientHeartRateLineChartState extends State<PatientHeartRateLineChart> {
  int heartRate = 0;
  List<double> heartRates = [0, 0, 0, 0, 0, 0]; // Initialize with six zeroes
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
          heartRate = data['heart_rate'];
          if (heartRates.length >= 6) {
            heartRates.removeAt(0);
          }
          heartRates.add(heartRate.toDouble());
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
    return LineChart(
      LineChartData(
        minX: 1,
        maxX: 6,
        minY: 0,
        maxY: 130,
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            dotData: const FlDotData(show: false),
            barWidth: 3,
            isCurved: true,
            color: const Color(0xffD62C2C).withOpacity(0.8),
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0xffD62C2C).withOpacity(0.6),
            ),
            spots: [
              for (int i = 0; i < heartRates.length; i++) FlSpot(i + 1, heartRates[i]),
            ],
          ),
        ],
      ),
    );
  }
}

