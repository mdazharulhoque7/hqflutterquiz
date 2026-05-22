import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hqflutterquiz/screens/result_summary/summary_item.dart';

class ResultSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const ResultSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
