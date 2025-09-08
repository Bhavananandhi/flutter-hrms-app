import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF333333),
          elevation: 0,
          centerTitle: true,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFF6200EE),
          unselectedLabelColor: Color(0xFF757575),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      home: const AttendanceTracker(),
    );
  }
}

class AttendanceTracker extends StatefulWidget {
  const AttendanceTracker({Key? key}) : super(key: key);
  static String routeName = '/attendance';

  @override
  State<AttendanceTracker> createState() => _AttendanceTrackerState();
}

class _AttendanceTrackerState extends State<AttendanceTracker>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? expandedDay;
  DateTime selectedDate = DateTime(2024, 4, 15); // April 15, 2024

  // Sample attendance data
  late Map<String, dynamic> monthData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initializeData();
  }

  void _initializeData() {
    // Initialize the attendance data
    monthData = {
      "name": DateFormat('MMMM yyyy').format(selectedDate),
      "summary": {
        "present": 20,
        "leave": 6,
        "holiday": 2,
        "totalWorkingDays": 22,
        "latePunchIns": 5,
      },
      "days": _generateDaysData(),
    };
  }

  List<Map<String, dynamic>> _generateDaysData() {
    // This would typically come from an API or database
    return [
      {
        "date": "1",
        "day": "Monday",
        "status": "absent",
        "reason": "Casual Leave",
        "leaveType": "Paid Leave",
        "approved": true,
      },
      {
        "date": "2",
        "day": "Tuesday",
        "status": "absent",
        "reason": "Casual Leave",
        "leaveType": "Paid Leave",
        "approved": true,
      },
      {
        "date": "3",
        "day": "Wednesday",
        "status": "absent",
        "reason": "Casual Leave",
        "leaveType": "Paid Leave",
        "approved": true,
      },
      {
        "date": "4",
        "day": "Thursday",
        "status": "present",
        "punchIn": "09:02 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 3m",
        "isLate": true,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "5",
        "day": "Friday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 5m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "6",
        "day": "Saturday",
        "status": "present",
        "punchIn": "08:58 AM",
        "punchOut": "06:10 PM",
        "workingHours": "9h 12m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "7",
        "day": "Sunday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "8",
        "day": "Monday",
        "status": "present",
        "punchIn": "08:57 AM",
        "punchOut": "06:03 PM",
        "workingHours": "9h 6m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "9",
        "day": "Tuesday",
        "status": "present",
        "punchIn": "08:59 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 6m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "10",
        "day": "Wednesday",
        "status": "absent",
        "reason": "Sick Leave",
        "leaveType": "Paid Leave",
        "approved": true,
      },
      {
        "date": "11",
        "day": "Thursday",
        "status": "present",
        "punchIn": "09:10 AM",
        "punchOut": "06:15 PM",
        "workingHours": "9h 5m",
        "isLate": true,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "12",
        "day": "Friday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "13",
        "day": "Saturday",
        "status": "absent",
        "reason": "Weekend Off",
        "leaveType": "Weekly Off",
        "approved": true,
      },
      {
        "date": "14",
        "day": "Sunday",
        "status": "absent",
        "reason": "Weekend Off",
        "leaveType": "Weekly Off",
        "approved": true,
      },
      {
        "date": "15",
        "day": "Monday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "16",
        "day": "Tuesday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "17",
        "day": "Wednesday",
        "status": "absent",
        "reason": "Public Holiday",
        "leaveType": "Holiday",
        "approved": true,
      },
      {
        "date": "18",
        "day": "Thursday",
        "status": "present",
        "punchIn": "09:05 AM",
        "punchOut": "06:10 PM",
        "workingHours": "9h 5m",
        "isLate": true,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "19",
        "day": "Friday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 5m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "20",
        "day": "Saturday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "21",
        "day": "Sunday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "22",
        "day": "Monday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "23",
        "day": "Tuesday",
        "status": "present",
        "punchIn": "09:15 AM",
        "punchOut": "06:20 PM",
        "workingHours": "9h 5m",
        "isLate": true,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "24",
        "day": "Wednesday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "25",
        "day": "Thursday",
        "status": "absent",
        "reason": "Public Holiday",
        "leaveType": "Holiday",
        "approved": true,
      },
      {
        "date": "26",
        "day": "Friday",
        "status": "absent",
        "reason": "Casual Leave",
        "leaveType": "Paid Leave",
        "approved": true,
      },
      {
        "date": "27",
        "day": "Saturday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "28",
        "day": "Sunday",
        "status": "present",
        "punchIn": "08:55 AM",
        "punchOut": "06:05 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "29",
        "day": "Monday",
        "status": "present",
        "punchIn": "08:50 AM",
        "punchOut": "06:00 PM",
        "workingHours": "9h 10m",
        "isLate": false,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
      {
        "date": "30",
        "day": "Tuesday",
        "status": "present",
        "punchIn": "09:10 AM",
        "punchOut": "06:15 PM",
        "workingHours": "9h 5m",
        "isLate": true,
        "breakTime": "1h 0m",
        "location": "Main Office",
      },
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Navigate to previous month
  void _prevMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      );
      _initializeData();
    });
  }

  // Navigate to next month
  void _nextMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      );
      _initializeData();
    });
  }

  // Toggle expanded day
  void _toggleDay(String date) {
    setState(() {
      if (expandedDay == date) {
        expandedDay = null;
      } else {
        expandedDay = date;
      }
    });
  }

  // Helper function to get status color
  Color _getStatusColor(String status, bool isLate) {
    if (status == "present") {
      return isLate ? const Color(0xFFFFA726) : const Color(0xFF26A69A);
    } else if (status == "absent") {
      return const Color(0xFFEF5350);
    }
    return const Color(0xFF42A5F5); // Holiday
  }

  // Helper function to get status text
  String _getStatusText(Map<String, dynamic> day) {
    if (day["status"] == "present") {
      return day["isLate"] ? "Late" : "Present";
    } else {
      return day["leaveType"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Added back navigation functionality
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Month/Year Filter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: 'Month',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    value: selectedDate.month,
                    items: List.generate(12, (index) {
                      final month = index + 1;
                      return DropdownMenuItem(
                        value: month,
                        child: Text(
                          DateFormat('MMMM').format(DateTime(2024, month)),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = DateTime(
                            selectedDate.year,
                            value,
                            selectedDate.day,
                          );
                          _initializeData();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(
                      labelText: 'Year',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    value: selectedDate.year,
                    items:
                        [2022, 2023, 2024, 2025].map((year) {
                          return DropdownMenuItem(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedDate = DateTime(
                            value,
                            selectedDate.month,
                            selectedDate.day,
                          );
                          _initializeData();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Summary Cards
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSummaryCard(
                    title: 'Present',
                    value: monthData["summary"]["present"].toString(),
                    color: const Color(0xFF26A69A),
                    lightColor: const Color(0xFFE0F2F1),
                  ),
                  _buildSummaryCard(
                    title: 'Leave',
                    value: monthData["summary"]["leave"].toString(),
                    color: const Color(0xFFEF5350),
                    lightColor: const Color(0xFFFFEBEE),
                  ),
                  _buildSummaryCard(
                    title: 'Holiday',
                    value: monthData["summary"]["holiday"].toString(),
                    color: const Color(0xFF42A5F5),
                    lightColor: const Color(0xFFE3F2FD),
                  ),
                  _buildSummaryCard(
                    title: 'Late',
                    value: monthData["summary"]["latePunchIns"].toString(),
                    color: const Color(0xFFFFA726),
                    lightColor: const Color(0xFFFFF3E0),
                  ),
                  _buildSummaryCard(
                    title: 'Days',
                    value: monthData["summary"]["totalWorkingDays"].toString(),
                    color: const Color(0xFF78909C),
                    lightColor: const Color(0xFFECEFF1),
                  ),
                ],
              ),
            ),
          ),

          // Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              tabs: const [Tab(text: 'Daily View'), Tab(text: 'Calendar')],
              indicatorColor: const Color(0xFF6200EE),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Daily View Tab
                _buildDailyView(),

                // Calendar View Tab
                _buildCalendarView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String value,
    required Color color,
    required Color lightColor,
  }) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }

  Widget _buildDailyView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: monthData["days"].length,
      itemBuilder: (context, index) {
        final day = monthData["days"][index];
        final isExpanded = expandedDay == day["date"];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: _getStatusColor(
                day["status"],
                day["isLate"] ?? false,
              ).withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // Day Header
              InkWell(
                onTap: () => _toggleDay(day["date"]),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Date Circle
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getStatusColor(
                            day["status"],
                            day["isLate"] ?? false,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            day["date"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Day Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day["day"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${DateFormat('MMMM').format(selectedDate)} ${day["date"]}, ${selectedDate.year}",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            day["status"],
                            day["isLate"] ?? false,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _getStatusText(day),
                          style: TextStyle(
                            color: _getStatusColor(
                              day["status"],
                              day["isLate"] ?? false,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Expand Icon
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),

              // Expanded Details
              if (isExpanded)
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                      day["status"],
                      day["isLate"] ?? false,
                    ).withOpacity(0.05),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child:
                      day["status"] == "present"
                          ? _buildPresentDayDetails(day)
                          : _buildAbsentDayDetails(day),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPresentDayDetails(Map<String, dynamic> day) {
    return Column(
      children: [
        const SizedBox(height: 8),
        // Punch In/Out Row
        Row(
          children: [
            Expanded(
              child: _buildDetailCard(title: 'Punch In', value: day["punchIn"]),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailCard(
                title: 'Punch Out',
                value: day["punchOut"],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Working Hours/Break Time Row
        Row(
          children: [
            Expanded(
              child: _buildDetailCard(
                title: 'Working Hours',
                value: day["workingHours"],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDetailCard(
                title: 'Break Time',
                value: day["breakTime"],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Location
        _buildDetailCard(title: 'Location', value: day["location"]),

        // Late Warning
        if (day["isLate"] == true)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: const Color(0xFFFFA726),
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  "Late arrival by ${day["punchIn"] == "09:02 AM"
                      ? "2 minutes"
                      : day["punchIn"] == "09:05 AM"
                      ? "5 minutes"
                      : day["punchIn"] == "09:10 AM"
                      ? "10 minutes"
                      : "15 minutes"}",
                  style: const TextStyle(
                    color: Color(0xFFFFA726),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAbsentDayDetails(Map<String, dynamic> day) {
    return Column(
      children: [
        const SizedBox(height: 8),
        // Reason
        _buildDetailCard(title: 'Reason', value: day["reason"]),
        const SizedBox(height: 8),
        // Leave Type
        _buildDetailCard(title: 'Leave Type', value: day["leaveType"]),

        // Approved Status
        if (day["approved"] == true)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: const Color(0xFF26A69A),
                  size: 18,
                ),
                const SizedBox(width: 4),
                const Text(
                  "Approved",
                  style: TextStyle(color: Color(0xFF26A69A), fontSize: 13),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDetailCard({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Calendar Header with Month/Year and Navigation
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left, size: 20),
                        onPressed: _prevMonth,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right, size: 20),
                        onPressed: _nextMonth,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Weekday Headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeekdayHeader('S', isWeekend: true),
              _buildWeekdayHeader('M'),
              _buildWeekdayHeader('T'),
              _buildWeekdayHeader('W'),
              _buildWeekdayHeader('T'),
              _buildWeekdayHeader('F'),
              _buildWeekdayHeader('S', isWeekend: true),
            ],
          ),

          const SizedBox(height: 12),

          // Calendar Grid
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 31, // 1 empty cell + 30 days
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Empty cell for the first day
                  return const SizedBox();
                }

                final dayIndex = index - 1;
                final dayNumber = (dayIndex + 1).toString();

                // Find the day data
                final dayData = monthData["days"].firstWhere(
                  (day) => day["date"] == dayNumber,
                  orElse: () => {"status": "", "isLate": false},
                );

                final isSelected = expandedDay == dayNumber;

                return GestureDetector(
                  onTap: () => _toggleDay(dayNumber),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          dayData["status"].isNotEmpty
                              ? _getStatusColor(
                                dayData["status"],
                                dayData["isLate"] ?? false,
                              )
                              : Colors.transparent,
                      shape: BoxShape.circle,
                      border:
                          isSelected
                              ? Border.all(color: Colors.black, width: 2)
                              : null,
                    ),
                    child: Center(
                      child: Text(
                        dayNumber,
                        style: TextStyle(
                          color:
                              dayData["status"].isNotEmpty
                                  ? Colors.white
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Legend
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendItem('Present', const Color(0xFF26A69A)),
                _buildLegendItem('Late', const Color(0xFFFFA726)),
                _buildLegendItem('Leave', const Color(0xFFEF5350)),
                _buildLegendItem('Holiday', const Color(0xFF42A5F5)),
                _buildLegendItem('Weekend', const Color(0xFF78909C)),
              ],
            ),
          ),

          // Selected Day Details
          if (expandedDay != null) ...[
            const SizedBox(height: 16),
            _buildSelectedDayDetails(),
          ],
        ],
      ),
    );
  }

  Widget _buildWeekdayHeader(String day, {bool isWeekend = false}) {
    return SizedBox(
      width: 30,
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isWeekend ? Colors.red : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSelectedDayDetails() {
    final selectedDayData = monthData["days"].firstWhere(
      (day) => day["date"] == expandedDay,
      orElse: () => {},
    );

    if (selectedDayData.isEmpty) {
      return const SizedBox();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${DateFormat('MMMM').format(selectedDate)} ${selectedDayData["date"]}, ${selectedDate.year}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),

          // Day details based on status
          selectedDayData["status"] == "present"
              ? Column(
                children: [
                  _buildDetailRow(
                    'Status:',
                    selectedDayData["isLate"] ? "Late" : "Present",
                  ),
                  _buildDetailRow('Punch In:', selectedDayData["punchIn"]),
                  _buildDetailRow('Punch Out:', selectedDayData["punchOut"]),
                  _buildDetailRow(
                    'Working Hours:',
                    selectedDayData["workingHours"],
                  ),
                ],
              )
              : Column(
                children: [
                  _buildDetailRow('Status:', selectedDayData["leaveType"]),
                  _buildDetailRow('Reason:', selectedDayData["reason"]),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
