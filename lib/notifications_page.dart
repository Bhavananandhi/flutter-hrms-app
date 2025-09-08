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
      title: 'GRMS Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NotificationsPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/leaveStatus': (context) => const StatusPage(type: 'Leave'),
        '/expenseStatus': (context) => const StatusPage(type: 'Expense'),
        '/resignationStatus':
            (context) => const StatusPage(type: 'Resignation'),
        '/approvalRequest': (context) => const ApprovalPage(),
      },
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      id: '1',
      title: 'Leave Request Approved',
      description: 'Your leave request for July 15-18 has been approved',
      time: '10 min ago',
      type: NotificationType.leave,
      status: 'approved',
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      title: 'New Approval Request',
      description: 'John Doe submitted a leave request for your approval',
      time: '30 min ago',
      type: NotificationType.approval,
      status: 'pending',
      isRead: false,
    ),
    NotificationItem(
      id: '3',
      title: 'Expense Rejected',
      description: 'Your expense report #EXP-0642 needs corrections',
      time: 'Yesterday',
      type: NotificationType.expense,
      status: 'rejected',
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      title: 'Resignation Accepted',
      description: 'Your resignation has been accepted by HR',
      time: 'Jul 20',
      type: NotificationType.resignation,
      status: 'approved',
      isRead: true,
    ),
    NotificationItem(
      id: '5',
      title: 'Urgent: 3 Approvals Pending',
      description: 'You have 3 pending requests waiting for your action',
      time: 'Jul 18',
      type: NotificationType.reminder,
      status: 'pending',
      isRead: true,
    ),
  ];

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.isRead = true;
      }
    });
  }

  void clearAll() {
    setState(() {
      notifications.clear();
    });
  }

  void handleNotificationTap(NotificationItem notification) {
    setState(() {
      notification.isRead = true;
    });

    // Navigation based on notification type
    switch (notification.type) {
      case NotificationType.leave:
        Navigator.pushNamed(context, '/leaveStatus');
        break;
      case NotificationType.expense:
        Navigator.pushNamed(context, '/expenseStatus');
        break;
      case NotificationType.resignation:
        Navigator.pushNamed(context, '/resignationStatus');
        break;
      case NotificationType.approval:
        Navigator.pushNamed(context, '/approvalRequest');
        break;
      case NotificationType.reminder:
        Navigator.pushNamed(context, '/approvalRequest');
        break;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData getTypeIcon(NotificationType type) {
    switch (type) {
      case NotificationType.leave:
        return Icons.beach_access;
      case NotificationType.expense:
        return Icons.attach_money;
      case NotificationType.resignation:
        return Icons.logout;
      case NotificationType.approval:
        return Icons.how_to_reg;
      case NotificationType.reminder:
        return Icons.notification_important;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3C4F76)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            color: const Color(0xFF3C4F76),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF3C4F76)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF3C4F76).withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child:
                notifications.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/no_notifications.png',
                            width: 150,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'No notifications yet',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF3C4F76),
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'You\'ll see important updates here',
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Dismissible(
                          key: Key(notification.id),
                          background: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              notifications.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Dismissed ${notification.title}',
                                ),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                          child: InkWell(
                            onTap: () => handleNotificationTap(notification),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color:
                                      notification.isRead
                                          ? Colors.transparent
                                          : const Color(
                                            0xFF3C4F76,
                                          ).withOpacity(0.2),
                                  width: 1.5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: getStatusColor(
                                              notification.status,
                                            ).withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            getTypeIcon(notification.type),
                                            color: getStatusColor(
                                              notification.status,
                                            ),
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      notification.title,
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15,
                                                            color: const Color(
                                                              0xFF3C4F76,
                                                            ),
                                                          ),
                                                    ),
                                                  ),
                                                  if (!notification.isRead)
                                                    Container(
                                                      width: 8,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                          0xFF3C4F76,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                notification.description,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.grey[700],
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 4,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: getStatusColor(
                                                        notification.status,
                                                      ).withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      notification.status
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                            color:
                                                                getStatusColor(
                                                                  notification
                                                                      .status,
                                                                ),
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    notification.time,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.grey[500],
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (notification.type ==
                                      NotificationType.reminder)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '3',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          if (notifications.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: markAllAsRead,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: const Color(0xFF3C4F76).withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        'Mark All Read',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF3C4F76),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: clearAll,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3C4F76),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Clear All',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

enum NotificationType { leave, expense, resignation, approval, reminder }

class NotificationItem {
  final String id;
  final String title;
  final String description;
  final String time;
  final NotificationType type;
  final String status;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    required this.status,
    required this.isRead,
  });
}

// Demo pages for navigation
class StatusPage extends StatelessWidget {
  final String type;
  const StatusPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Status')),
      body: Center(child: Text('$type Status Details Page')),
    );
  }
}

class ApprovalPage extends StatelessWidget {
  const ApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approval Requests')),
      body: const Center(child: Text('Approval Requests Page')),
    );
  }
}
