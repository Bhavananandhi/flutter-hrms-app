import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LeaveManagementPage extends StatefulWidget {
  const LeaveManagementPage({Key? key}) : super(key: key);

  static String routeName = '/leave';

  @override
  State<LeaveManagementPage> createState() => _LeaveManagementPageState();
}

class _LeaveManagementPageState extends State<LeaveManagementPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  String? _leaveType;
  String? _leaveDuration;
  final TextEditingController _reasonController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  double _dayCount = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate! : _endDate!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF1B6EB0)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 213, 220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Leave Management',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFFB6BCC0),
          indicatorColor: const Color(0xFF1B6EB0),
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Apply'),
            Tab(text: 'Status'),
            Tab(text: 'History'),
            Tab(text: 'Holidays'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Apply Tab
          _buildApplyTab(context),

          // Status Tab
          _buildStatusTab(context),

          // History Tab
          _buildHistoryTab(context),

          // Holidays Tab
          _buildHolidaysTab(context),
        ],
      ),
    );
  }

  Widget _buildApplyTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leave Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B6EB0), Color(0xFF0A1F44)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    lineWidth: 8,
                    percent: 0.6,
                    progressColor: Colors.white,
                    backgroundColor: const Color(0xFF5CA0DB),
                    center: Text(
                      '50%',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Leave Balance',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '12 days remaining',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Out of 18 days',
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Leave Type Dropdown
            Text(
              'Leave Type',
              style: GoogleFonts.poppins(
                color: const Color(0xFF474F56),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF756767)),
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: InputBorder.none,
                ),
                hint: const Text('Select leave type'),
                value: _leaveType,
                items:
                    ['Sick Leave', 'Casual Leave']
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _leaveType = value;
                  });
                },
                validator:
                    (value) =>
                        value == null ? 'Please select leave type' : null,
              ),
            ),

            const SizedBox(height: 16),

            // Leave Duration Dropdown
            Text(
              'Leave Duration',
              style: GoogleFonts.poppins(
                color: const Color(0xFF474F56),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF756767)),
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: InputBorder.none,
                ),
                hint: const Text('Select leave duration'),
                value: _leaveDuration,
                items:
                    [
                          'Full Day',
                          'Half Day (Morning)',
                          'Half Day (Afternoon)',
                          'Multiple Days',
                        ]
                        .map(
                          (duration) => DropdownMenuItem(
                            value: duration,
                            child: Text(duration),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _leaveDuration = value;
                    if (value == 'Half Day (Morning)' ||
                        value == 'Half Day (Afternoon)') {
                      _dayCount = 0.5;
                    } else if (value == 'Multiple Days') {
                      _dayCount = 1.0;
                    }
                  });
                },
                validator:
                    (value) =>
                        value == null ? 'Please select leave duration' : null,
              ),
            ),

            const SizedBox(height: 16),

            // Leave Dates
            Text(
              'Leave Dates',
              style: GoogleFonts.poppins(
                color: const Color(0xFF474F56),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF756767)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              _startDate != null
                                  ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                                  : 'Select date',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context, true),
                        ),
                      ],
                    ),
                  ),
                ),

                if (_leaveDuration == 'Multiple Days') ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF756767)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                _endDate != null
                                    ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                                    : 'Select date',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context, false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Reason Field
            Text(
              'Reason',
              style: GoogleFonts.poppins(
                color: const Color(0xFF474F56),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _reasonController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter reason for leave',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF756767)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a reason';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B6EB0),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit leave application
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Leave application submitted successfully',
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Apply for Leave',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Approved Leave Card
          _buildStatusCard(
            context,
            'Sick Leave',
            'Approved',
            '14 Apr 2025',
            '1 Day',
            '14 Apr 2025',
            '14 Apr 2025',
            const Color(0xFFACE7AF),
            const Color(0xFF0A480A),
            Icons.check_circle,
          ),
          const SizedBox(height: 16),

          // Pending Leave Card
          _buildStatusCard(
            context,
            'Casual Leave',
            'Pending',
            '14 - 16 Apr 2025',
            '2 Days',
            '14 Apr 2025',
            'Pending',
            const Color(0xFFFCE2BD),
            const Color(0xFFD48107),
            Icons.timer,
            showActions: true,
          ),
          const SizedBox(height: 16),

          // Rejected Leave Card
          _buildStatusCard(
            context,
            'Earned Leave',
            'Rejected',
            '20 Apr 2025',
            '1 Day',
            '20 Apr 2025',
            '20 Apr 2025',
            const Color(0xFFF9D9D7),
            Colors.red,
            Icons.cancel,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(
    BuildContext context,
    String leaveType,
    String status,
    String date,
    String duration,
    String appliedOn,
    String actionOn,
    Color statusBgColor,
    Color statusColor,
    IconData statusIcon, {
    bool showActions = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leaveType,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      status,
                      style: GoogleFonts.poppins(
                        color: statusColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(statusIcon, size: 16, color: statusColor),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 8),
              Text(date),
              const Spacer(),
              const Icon(Icons.timer, size: 16),
              const SizedBox(width: 8),
              Text(duration),
            ],
          ),
          const Divider(height: 24, thickness: 1),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Applied on:', style: GoogleFonts.poppins(fontSize: 12)),
                  Text('$status on:', style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appliedOn, style: GoogleFonts.poppins(fontSize: 12)),
                  Text(actionOn, style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
            ],
          ),
          if (showActions) ...[
            const Divider(height: 24, thickness: 1),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text('Cancel Leave'),
                              content: const Text(
                                'Are you sure you want to cancel this leave request?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Leave request cancelled',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                      );
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1B6EB0)),
                    ),
                    onPressed: () {
                      // Modify leave logic
                    },
                    child: Text(
                      'Modify',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1B6EB0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHistoryTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leave Balances
          Text(
            'Leave Balances',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildBalanceCard('Sick Leave', '6/6', 'Not Available', const [
                Color(0xFF1B6EB0),
                Color(0xFF5839D2),
              ]),
              const SizedBox(width: 12),
              _buildBalanceCard(
                'Casual Leave',
                '10/18',
                'Currently Available',
                const [Color(0xFFEFD339), Color(0xFFD27339)],
              ),
              const SizedBox(width: 12),
              _buildBalanceCard(
                'Earned Leave',
                '10/18',
                'Currently Available',
                const [Color(0xFFF181C7), Color(0xFFAE1ABD)],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Leave History
          Row(
            children: [
              const Icon(Icons.access_time, size: 20),
              const SizedBox(width: 8),
              Text(
                'Leave History',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _buildHistoryItem('21 Sep, Mon', 'Casual Leave', '1 Day'),
              _buildHistoryItem('21 - 23 Sep, Mon', 'Sick Leave', '2 Days'),
              _buildHistoryItem('25 Sep, Wed', 'Casual Leave', '1 Day'),
              _buildHistoryItem('28 - 30 Sep, Sat', 'Earned Leave', '2 Days'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(
    String title,
    String balance,
    String status,
    List<Color> gradientColors,
  ) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              balance.split('/')[0],
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '/${balance.split('/')[1]}',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              status,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String type, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, size: 20, color: Color(0xFF365872)),
          const SizedBox(width: 12),
          Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalDivider(
            thickness: 2,
            color: Color(0xFF157569),
            width: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.circle, size: 6, color: Color(0xFF737778)),
                  const SizedBox(width: 4),
                  Text(duration, style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHolidaysTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Calendar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'April 2025',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, size: 16),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Calendar days would go here
                // This is simplified for the example
                Container(
                  height: 200,
                  color: Colors.grey[100],
                  child: const Center(child: Text('Calendar View')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Holidays List
          _buildHolidayItem(
            'Teachers Day',
            '7 Dec, Thu',
            const Color(0x99FED01C),
            const Color(0x99695606),
          ),
          _buildHolidayItem(
            'Sick Leave',
            '12 Dec, Tue',
            const Color(0x8FF0928E),
            const Color(0x8FC90E05),
          ),
          _buildHolidayItem(
            'Ganesh Chaturthi',
            '22 Dec, Fri',
            const Color(0x99FED01C),
            const Color(0x99695606),
          ),
          _buildHolidayItem(
            'Casual Leave',
            '12 Dec, Tue',
            const Color(0xFFBBF5A8),
            const Color(0xFF0E8918),
          ),
        ],
      ),
    );
  }

  Widget _buildHolidayItem(
    String title,
    String date,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(Icons.calendar_today, size: 20, color: iconColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                date,
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
