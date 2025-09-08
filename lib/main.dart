import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_app/attenance_tracker.dart';
import 'package:hrms_app/feedback_page.dart';
import 'package:hrms_app/leave_management_page.dart';
import 'package:hrms_app/new_expenses_page_widget.dart';
import 'package:hrms_app/learning_page.dart';
import 'package:hrms_app/new_settings_page_widget.dart';
import 'package:hrms_app/notifications_page.dart';
import 'package:hrms_app/payslip_page.dart';
import 'package:hrms_app/profile_page.dart';
import 'package:hrms_app/resignation_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HRMS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NewHomePage(),
      debugShowCheckedModeBanner: false,

      routes: {
        ProfilePage.routeName: (context) => const ProfilePage(),
        LeaveManagementPage.routeName: (context) => const LeaveManagementPage(),
        LearningPage.routeName: (context) => const LearningPage(),
        NewExpensesPageWidget.routeName:
            (context) => const NewExpensesPageWidget(),
        FeedbackPage.routeName: (context) => const FeedbackPage(),
        NewSettingsPageWidget.routeName:
            (context) => const NewSettingsPageWidget(),
        AttendanceTracker.routeName: (context) => const AttendanceTracker(),
        PayslipsPage.routeName: (context) => const PayslipsPage(),
        ResignationPage.routeName: (context) => const ResignationPage(),
        '/notifications': (context) => const NotificationsPage(),
      },
    );
  }
}

class NewHomePage extends StatefulWidget {
  static const String routeName = '/home';

  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Header Section
                _buildHeaderSection(context),

                // Punch In/Out Card
                _buildPunchCard(context),

                // Attendance Summary
                _buildAttendanceSummary(context),

                // Quick Actions
                _buildQuickActions(context),

                // Upcoming Holidays
                _buildUpcomingHolidays(context),

                // Learning Progress
                _buildLearningProgress(context),

                // Birthdays & Events
                _buildBirthdaysEvents(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1193FA), Color(0xFF11F3D4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1193FA), Color(0xFF11F3D4)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                'Core Volt Matrix',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'My Profile',
              onTap: () => _navigateTo(context, '/profile'),
            ),
            _buildDrawerItem(
              icon: Icons.calendar_today,
              title: 'Attendance',
              onTap: () => _navigateTo(context, '/attendance'),
            ),
            _buildDrawerItem(
              icon: Icons.work_off,
              title: 'Leave Management',
              onTap: () => _navigateTo(context, '/leave'),
            ),
            _buildDrawerItem(
              icon: FontAwesomeIcons.moneyCheckAlt,
              title: 'Expenses',
              onTap: () => _navigateTo(context, '/expenses'),
            ),
            _buildDrawerItem(
              icon: Icons.payment,
              title: 'Pay Slips',
              onTap: () => _navigateTo(context, '/payslips'),
            ),
            _buildDrawerItem(
              icon: Icons.person_remove,
              title: 'Resignation',
              onTap: () => _navigateTo(context, '/resignation'),
            ),
            _buildDrawerItem(
              icon: Icons.auto_graph,
              title: 'Learning Page',
              onTap: () => _navigateTo(context, '/learning'),
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () => _navigateTo(context, '/settings'),
            ),
            _buildDrawerItem(
              icon: Icons.feedback,
              title: 'Feedback',
              onTap: () => _navigateTo(context, '/feedback'),
            ),
            const Divider(color: Colors.white54),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => _navigateTo(context, '/welcome'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      height: 185,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00A3FF), Color(0xFF0E5488)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 40, 12, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                Text(
                  'Core Voltmatrix',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/notifications');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Lokesh Yegireddy',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/seed/308/600',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPunchCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today, 21 Sep 2025',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF9F9F9F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB0CEF3),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      'Working Day',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF086ABB),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Punch In',
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '09:00 AM',
                        style: GoogleFonts.interTight(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0xFFB1B5B5),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Punch Out',
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '06:30 PM',
                        style: GoogleFonts.interTight(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A78D0),
                  minimumSize: const Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Punch In',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Text(
            'Attendance Summary',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAttendanceItem(
                count: '12',
                icon: Icons.check_circle_outline,
                color: const Color(0xFF9DFF8D),
                iconColor: const Color(0xFF5DDF5D),
                label: 'Present',
              ),
              _buildAttendanceItem(
                count: '6',
                icon: Icons.clear,
                color: const Color(0xFFFDC0BD),
                iconColor: const Color(0xFFF05B5B),
                label: 'Leave',
              ),
              _buildAttendanceItem(
                count: '3',
                icon: Icons.check_circle_outline,
                color: const Color(0xFFFCE0A9),
                iconColor: const Color(0xFFEBA529),
                label: 'Late',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttendanceItem({
    required String count,
    required IconData icon,
    required Color color,
    required Color iconColor,
    required String label,
  }) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 12,
            child: Text(
              count,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(icon, color: iconColor),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Text(
            'Quick Actions',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickActionItem(
                    icon: Icons.calendar_today,
                    label: 'Attendance',
                    onTap: () => _navigateTo(context, '/attendance'),
                  ),
                  _buildQuickActionItem(
                    icon: Icons.work_off,
                    label: 'Leave',
                    onTap: () => _navigateTo(context, '/leave'),
                  ),
                  _buildQuickActionItem(
                    icon: Icons.auto_graph,
                    label: 'Learnings',
                    onTap: () => _navigateTo(context, '/learning'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickActionItem(
                    icon: Icons.payment,
                    label: 'Pay Slips',
                    onTap: () => _navigateTo(context, '/payslips'),
                  ),
                  _buildQuickActionItem(
                    icon: FontAwesomeIcons.moneyCheckAlt,
                    label: 'Expenses',
                    onTap: () => _navigateTo(context, '/expenses'),
                  ),
                  _buildQuickActionItem(
                    icon: Icons.settings,
                    label: 'Settings',
                    onTap: () => _navigateTo(context, '/settings'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
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
            child: Icon(icon, color: const Color(0xFF1F89EE), size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingHolidays(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Holidays',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                'View all',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1785CD),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            children: [
              _buildHolidayCard(
                day: '12',
                month: 'May',
                title: 'Good Friday',
                date: 'Friday, May 2025',
              ),
              const SizedBox(width: 12),
              _buildHolidayCard(
                day: '5',
                month: 'Sep',
                title: 'Teachers Day',
                date: 'Friday, September 2025',
              ),
              const SizedBox(width: 12),
              _buildHolidayCard(
                day: '1',
                month: 'May',
                title: 'May Day',
                date: 'Friday, May 2025',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHolidayCard({
    required String day,
    required String month,
    required String title,
    required String date,
  }) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Container(
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4545),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      month,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
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

  Widget _buildLearningProgress(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
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
                  'Learning Progress',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.navigate_next,
                    color: Color(0xFFBDB8B8),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 10,
                  percent: 0.5,
                  progressColor: const Color(0xFF14AAE8),
                  backgroundColor: const Color(0xFFF0EEEE),
                  center: const Text(
                    '<>',
                    style: TextStyle(color: Color(0xFF177EC3), fontSize: 18),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Advanced React Development',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '30% completed · 12 hours remaining',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF878A8A),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearPercentIndicator(
              percent: 0.5,
              width: MediaQuery.of(context).size.width - 80,
              lineHeight: 12,
              progressColor: const Color(0xFF14AAE8),
              backgroundColor: const Color(0xFFEBE7E7),
              barRadius: const Radius.circular(12),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue Learning',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF14AAE8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '3 Days Left',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF9BA5A5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthdaysEvents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Birthdays & Events',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                'View all',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF1785CD),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            children: [
              _buildBirthdayCard(
                name: 'Bhavana',
                date: 'Today',
                imageUrl: 'https://picsum.photos/seed/115/600',
              ),
              const SizedBox(width: 12),
              _buildBirthdayCard(
                name: 'Sahitya',
                date: 'Tomorrow',
                imageUrl: 'https://picsum.photos/seed/115/600',
              ),
              const SizedBox(width: 12),
              _buildBirthdayCard(
                name: 'Lokesh',
                date: 'Oct 5',
                imageUrl: 'https://picsum.photos/seed/115/600',
              ),
              const SizedBox(width: 12),
              _buildBirthdayCard(
                name: 'Anjani',
                date: 'May 25',
                imageUrl: 'https://picsum.photos/seed/115/600',
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildBirthdayCard({
    required String name,
    required String date,
    required String imageUrl,
  }) {
    return Container(
      width: 134,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Text(
            date,
            style: GoogleFonts.inter(
              color: const Color(0xFF1D6EE2),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
