import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _editProfile = false;
  String _editEmail = 'nandhiganabhavana@gmail.com';
  String _editPhone = '9992228880';
  String _editDob = '21/09/2004';
  String _editAddress = 'Visakhapatnam';
  DateTime? _datePicked;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _emailController.text = _editEmail;
    _phoneController.text = _editPhone;
    _addressController.text = _editAddress;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: size.height * 0.35,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileHeader(theme, size),
                collapseMode: CollapseMode.parallax,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: Icon(_editProfile ? Icons.check : Icons.edit_rounded),
                  onPressed: () {
                    if (_editProfile) {
                      setState(() {
                        _editEmail = _emailController.text;
                        _editPhone = _phoneController.text;
                        _editAddress = _addressController.text;
                      });
                    }
                    setState(() => _editProfile = !_editProfile);
                  },
                ),
              ],
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              color: theme.cardColor,
              child: TabBar(
                controller: _tabController,
                labelColor: theme.primaryColor,
                unselectedLabelColor: theme.unselectedWidgetColor,
                indicatorColor: theme.primaryColor,
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: 'Personal'),
                  Tab(text: 'Official'),
                  Tab(text: 'Account'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPersonalTab(theme),
                  _buildOfficialTab(theme),
                  _buildAccountTab(theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme, Size size) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.primaryColor.withOpacity(0.8),
                theme.primaryColor.withOpacity(0.4),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.15,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Hero(
                tag: 'profile-picture',
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3b21lbnxlbnwwfHx8fDE3NDU3MzkxNTZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt_rounded, size: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Bhavana Nandigana',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 8,
                  child: LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalTab(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (!_editProfile) ...[
            _buildInfoCard(
              theme,
              title: 'Personal Information',
              items: [
                _InfoItem(
                  icon: Icons.email_rounded,
                  label: 'Email',
                  value: _editEmail,
                ),
                _InfoItem(
                  icon: Icons.phone_rounded,
                  label: 'Phone',
                  value: _editPhone,
                ),
                _InfoItem(
                  icon: Icons.cake_rounded,
                  label: 'Date of Birth',
                  value: _editDob,
                ),
                _InfoItem(
                  icon: Icons.location_on_rounded,
                  label: 'Address',
                  value: _editAddress,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildEmergencyContactCard(theme),
          ] else ...[
            _buildEditableForm(theme),
          ],
        ],
      ),
    );
  }

  Widget _buildEditableForm(ThemeData theme) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildEditableField(
                  theme,
                  label: 'Email',
                  controller: _emailController,
                  icon: Icons.email_rounded,
                ),
                const SizedBox(height: 16),
                _buildEditableField(
                  theme,
                  label: 'Phone',
                  controller: _phoneController,
                  icon: Icons.phone_rounded,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                _buildDatePickerField(theme),
                const SizedBox(height: 16),
                _buildEditableField(
                  theme,
                  label: 'Address',
                  controller: _addressController,
                  icon: Icons.location_on_rounded,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _editEmail = _emailController.text;
                _editPhone = _phoneController.text;
                _editAddress = _addressController.text;
                _editProfile = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Profile updated successfully',
                    style: GoogleFonts.poppins(),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Save Changes',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField(
    ThemeData theme, {
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        color: theme.textTheme.bodyLarge?.color,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
        ),
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        filled: true,
        fillColor: theme.cardColor,
      ),
    );
  }

  Widget _buildDatePickerField(ThemeData theme) {
    return InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: _datePicked ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                colorScheme: theme.colorScheme.copyWith(
                  primary: theme.primaryColor,
                  surface: theme.cardColor,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          setState(() {
            _datePicked = date;
            _editDob = "${date.day}/${date.month}/${date.year}";
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.dividerColor),
          color: theme.cardColor,
        ),
        child: Row(
          children: [
            Icon(Icons.cake_rounded, size: 20, color: theme.hintColor),
            const SizedBox(width: 16),
            Text(
              _datePicked == null
                  ? 'Select Date of Birth'
                  : '${_datePicked!.day}/${_datePicked!.month}/${_datePicked!.year}',
              style: GoogleFonts.poppins(
                color:
                    _datePicked == null
                        ? theme.textTheme.bodyMedium?.color?.withOpacity(0.6)
                        : theme.textTheme.bodyMedium?.color,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.calendar_today_rounded,
              size: 20,
              color: theme.hintColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyContactCard(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emergency Contact',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            _InfoItem(
              icon: Icons.person_rounded,
              label: 'Contact Person',
              value: 'John Doe',
            ),
            _InfoItem(
              icon: Icons.phone_rounded,
              label: 'Phone Number',
              value: '+1 234 567 890',
            ),
            _InfoItem(
              icon: Icons.contact_emergency_rounded,
              label: 'Relationship',
              value: 'Father',
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle edit emergency contact
                },
                child: Text(
                  'Edit Contact',
                  style: GoogleFonts.poppins(
                    color: theme.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfficialTab(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoCard(
            theme,
            title: 'Official Information',
            items: [
              _InfoItem(
                icon: Icons.badge_rounded,
                label: 'Employee ID',
                value: 'VM-1040-089',
              ),
              _InfoItem(
                icon: Icons.work_rounded,
                label: 'Designation',
                value: 'Associate Software Engineer',
              ),
              _InfoItem(
                icon: Icons.business_rounded,
                label: 'Department',
                value: 'Engineering',
              ),
              _InfoItem(
                icon: Icons.date_range_rounded,
                label: 'Date of Joining',
                value: 'April 07, 2025',
              ),
              _InfoItem(
                icon: Icons.work_history_rounded,
                label: 'Employment Type',
                value: 'Full-time',
              ),
              _InfoItem(
                icon: Icons.supervisor_account_rounded,
                label: 'Reporting To',
                value: 'Jane Smith (Engineering Manager)',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTeamCard(theme),
        ],
      ),
    );
  }

  Widget _buildTeamCard(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Team Members',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTeamMember(theme, 'Jane Smith', 'Engineering Manager'),
                  _buildTeamMember(theme, 'Mike Johnson', 'Senior Developer'),
                  _buildTeamMember(theme, 'Sarah Williams', 'UX Designer'),
                  _buildTeamMember(theme, 'David Brown', 'QA Engineer'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(ThemeData theme, String name, String role) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: theme.primaryColor, width: 2),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://randomuser.me/api/portraits/women/65.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name.split(' ')[0],
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            role.split(' ')[0],
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountTab(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInfoCard(
            theme,
            title: 'Bank Details',
            items: [
              _InfoItem(
                icon: Icons.account_balance_rounded,
                label: 'Bank Name',
                value: 'TechBank Financial',
              ),
              _InfoItem(
                icon: Icons.credit_card_rounded,
                label: 'Account Number',
                value: 'XXXX XXXX XXXX 9999',
              ),
              _InfoItem(
                icon: Icons.account_balance_wallet_rounded,
                label: 'Account Type',
                value: 'Savings',
              ),
              _InfoItem(
                icon: Icons.code_rounded,
                label: 'IFSC Code',
                value: 'TECH0001234',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoCard(
            theme,
            title: 'Account Status',
            items: [
              _InfoItem(
                icon: Icons.date_range_rounded,
                label: 'Account Created',
                value: 'Apr 25, 2025',
              ),
              _InfoItem(
                icon: Icons.verified_rounded,
                label: 'Verification Status',
                value: 'Verified',
                valueColor: Colors.green,
              ),
              _InfoItem(
                icon: Icons.security_rounded,
                label: 'Last Password Change',
                value: '2 weeks ago',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSecurityCard(theme),
        ],
      ),
    );
  }

  Widget _buildSecurityCard(ThemeData theme) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Security',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: Text(
                'Two-Factor Authentication',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              subtitle: Text(
                'Add an extra layer of security',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              value: true,
              onChanged: (value) {},
              activeColor: theme.primaryColor,
            ),
            SwitchListTile(
              title: Text(
                'Biometric Login',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              subtitle: Text(
                'Use fingerprint or face recognition',
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              value: false,
              onChanged: (value) {},
              activeColor: theme.primaryColor,
            ),
            ListTile(
              leading: const Icon(Icons.password_rounded),
              title: Text(
                'Change Password',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () {
                // Handle change password
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    ThemeData theme, {
    required String title,
    required List<_InfoItem> items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            ...items, // Directly use the _InfoItem widgets
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: theme.primaryColor),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: valueColor ?? theme.textTheme.bodyLarge?.color,
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
