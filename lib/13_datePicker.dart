import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Date & Time Picker",
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0XFF121212),
        cardColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: DatePickerExample(
        isDark: _isDark,
        onToggleTheme: () {
          setState(() => _isDark = !_isDark);
        },
      ),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const DatePickerExample({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  //---Date Picker----------

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    //if today is weekend -> move to next Monday
    while (now.weekday == DateTime.saturday || now.weekday == DateTime.sunday) {
      now = now.add(Duration(days: 1));
    }
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendar,
      //initialCalendarMode: DatePickerMode.day,
      selectableDayPredicate: (day) =>
          day.weekday != DateTime.saturday && day.weekday != DateTime.sunday,
      helpText: "SELECT DATE",
      cancelText: "CANCEL",
      confirmText: "OK",
      builder: (context, child) {
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.light(primary: Colors.blue)),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  //--------Time Picker------------
  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: "SELECT TIME",
      cancelText: "Cancel",
      confirmText: "OK",
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  //Using API (API's CODE)
  Future<void> sendDataToApi() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "date": _selectedDate?.toIso8601String(),
          "time": "${_selectedTime?.hour}:${_selectedTime?.minute}",
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("✅ Success! Data sent")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("⚠️ Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Date & Time Picker",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0XFF4FACFE), Color(0XFF00F2FE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: widget.isDark ? "Light Mode" : "Dark Mode",
            icon: Icon(widget.isDark ? Icons.nightlight_round : Icons.wb_sunny),
            onPressed: widget.onToggleTheme,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 60,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    onPressed: _pickDate,
                    icon: const Icon(Icons.date_range),
                    label: const Text("Select Date"),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _pickTime,
                    icon: const Icon(Icons.access_time),
                    label: const Text("Select Time"),
                  ),
                  const SizedBox(height: 25),
                  if (_selectedDate != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.blue),
                          const SizedBox(width: 10),
                          Text(
                            DateFormat('dd MMM yyyy').format(_selectedDate!),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (_selectedTime != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.blue),
                          const SizedBox(width: 10),
                          Text(
                            _selectedTime!.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: sendDataToApi,
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
