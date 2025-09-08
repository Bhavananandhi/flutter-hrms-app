import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payslips',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF87CEEB), // Light sky blue
          primary: const Color(0xFF3C4F76),
          secondary: const Color(0xFF87CEEB),
        ),
        useMaterial3: true,
      ),
      home: const PayslipsPage(),
    );
  }
}

class PayslipsPage extends StatefulWidget {
  const PayslipsPage({super.key});
  static const String routeName = '/payslips';

  @override
  State<PayslipsPage> createState() => _PayslipsPageState();
}

class _PayslipsPageState extends State<PayslipsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedYear1;
  String? _selectedMonth1;
  String? _selectedYear2;
  String? _selectedMonth2;

  final List<String> _years = ['2021', '2022', '2023', '2024', '2025'];
  final List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C4F76),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Pay Slips',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF18191B),
              unselectedLabelColor: Colors.grey,
              labelStyle: GoogleFonts.interTight(fontWeight: FontWeight.w500),
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: const [Tab(text: 'My PaySlip'), Tab(text: 'EPF')],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // My PaySlip Tab
                  _buildPaySlipTab(),
                  // EPF Tab
                  _buildEPFTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaySlipTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: _buildDropdown(
                  value: _selectedYear1,
                  hint: 'Select Year',
                  items: _years,
                  onChanged: (value) {
                    setState(() {
                      _selectedYear1 = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildDropdown(
                  value: _selectedMonth1,
                  hint: 'Select Month',
                  items: _months,
                  onChanged: (value) {
                    setState(() {
                      _selectedMonth1 = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 65),
            children: [
              _buildPaySlipCard('Lokesh Yegireddy', '1234', 'Apr 25, 2025'),
              _buildPaySlipCard('Lokesh Yegireddy', '1235', 'Mar 25, 2025'),
              _buildPaySlipCard('Lokesh Yegireddy', '1236', 'Feb 25, 2025'),
              _buildPaySlipCard('Lokesh Yegireddy', '1237', 'Jan 25, 2025'),
              _buildPaySlipCard('Lokesh Yegireddy', '1238', 'Dec 25, 2024'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEPFTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildInfoRow('Employee Name : ', 'Jhon'),
                  const SizedBox(height: 8),
                  _buildInfoRow('UAN Number : ', '1001XXXXXXXX'),
                  const SizedBox(height: 8),
                  _buildInfoRow('Status : ', 'Active'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    value: _selectedYear2,
                    hint: 'Select Year',
                    items: _years,
                    onChanged: (value) {
                      setState(() {
                        _selectedYear2 = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown(
                    value: _selectedMonth2,
                    hint: 'Select Month',
                    items: _months,
                    onChanged: (value) {
                      setState(() {
                        _selectedMonth2 = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildEPFDetailRow('Month', 'June'),
                  const SizedBox(height: 12),
                  _buildEPFDetailRow('Year', '2023'),
                  const SizedBox(height: 12),
                  _buildEPFDetailRow('EPF', '0.0'),
                  const SizedBox(height: 12),
                  _buildEPFDetailRow('FPF', '0.0'),
                  const SizedBox(height: 12),
                  _buildEPFDetailRow('Total Contribution', '0.0'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3C4F76)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint),
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        items:
            items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildPaySlipCard(String name, String id, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 8,
              child: Text(
                name,
                style: GoogleFonts.interTight(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 30,
              child: Text(
                'Pay Slip ID : $id',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
              ),
            ),
            Positioned(
              left: 12,
              bottom: 12,
              child: Text(
                date,
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
              ),
            ),
            Positioned(
              right: 12,
              top: 18,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3C4F76),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    // Handle download
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: GoogleFonts.inter(color: Colors.black)),
        Text(value, style: GoogleFonts.inter(color: Colors.black)),
      ],
    );
  }

  Widget _buildEPFDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.inter(color: Colors.black)),
        Text(value, style: GoogleFonts.inter(color: Colors.black)),
      ],
    );
  }
}
