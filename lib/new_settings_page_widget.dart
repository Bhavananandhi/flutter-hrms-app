import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(home: NewSettingsPageWidget()));
}

class NewSettingsPageWidget extends StatefulWidget {
  const NewSettingsPageWidget({super.key});
  static String routeName = '/settings';
  @override
  State<NewSettingsPageWidget> createState() => _NewSettingsPageWidgetState();
}

class _NewSettingsPageWidgetState extends State<NewSettingsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // State for switches
  bool switchListTileValue1 = true;
  bool switchListTileValue2 = true;
  bool switchListTileValue3 = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFB36AFB),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFF7F7F7),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Settings',
            style: GoogleFonts.poppins(
              color: const Color(0xFFF9F9F9),
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Account Settings Section
                _buildSectionHeader(
                  icon: Icons.account_circle_outlined,
                  iconColor: const Color(0xFF1D1DF8),
                  title: 'Account Settings',
                ),
                _buildSettingItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  trailing: _buildArrowButton(),
                ),
                _buildSettingItem(
                  icon: Icons.badge_outlined,
                  title: 'Personal Information',
                  trailing: _buildArrowButton(),
                ),
                const Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xBE565C63),
                ),

                // Notifications Section
                _buildSectionHeader(
                  icon: Icons.notifications_none,
                  iconColor: const Color(0xFFF8920A),
                  title: 'Notifications',
                ),
                SwitchListTile(
                  value: switchListTileValue1,
                  onChanged: (value) {
                    setState(() {
                      switchListTileValue1 = value;
                    });
                  },
                  title: Text(
                    'App Notifications',
                    style: GoogleFonts.poppins(color: const Color(0xFF000407)),
                  ),
                  subtitle: Text(
                    'Enable/disable all notifications',
                    style: GoogleFonts.inter(color: const Color(0xFF343B40)),
                  ),
                  activeColor: const Color(0xFFB36AFB),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                const Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xBE565C63),
                ),

                // Security Section
                _buildSectionHeader(
                  icon: Icons.security_sharp,
                  iconColor: const Color(0xFFF90606),
                  title: 'Security',
                ),
                SwitchListTile(
                  value: switchListTileValue2,
                  onChanged: (value) {
                    setState(() {
                      switchListTileValue2 = value;
                    });
                  },
                  title: Text(
                    'Biometric Authentication',
                    style: GoogleFonts.poppins(color: const Color(0xFF000407)),
                  ),
                  subtitle: Text(
                    'Use fingerprint or face ID',
                    style: GoogleFonts.inter(color: const Color(0xFF343B40)),
                  ),
                  activeColor: const Color(0xFFB36AFB),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                _buildSettingItem(
                  icon: Icons.shield_outlined,
                  title: 'Two-Factor Authentication',
                  trailing: _buildArrowButton(),
                ),
                const Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xBE565C63),
                ),

                // Appearance Section
                _buildSectionHeader(
                  icon: Icons.format_paint_outlined,
                  iconColor: const Color(0xFFF206F2),
                  title: 'Appearance',
                ),
                SwitchListTile(
                  value: switchListTileValue3,
                  onChanged: (value) {
                    setState(() {
                      switchListTileValue3 = value;
                    });
                  },
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.poppins(color: const Color(0xFF000203)),
                  ),
                  subtitle: Text(
                    'Switch between light/dark theme',
                    style: GoogleFonts.inter(color: const Color(0xFF343B40)),
                  ),
                  activeColor: const Color(0xFFB16EF3),
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                _buildSettingItem(
                  icon: Icons.color_lens_outlined,
                  title: 'Colour Theme',
                  trailing: _buildArrowButton(),
                ),
                const Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xBE565C63),
                ),

                // Help & Support Section
                _buildSectionHeader(
                  icon: Icons.help_outline,
                  iconColor: const Color(0xFF08CCF4),
                  title: 'Help & Support',
                ),
                _buildSettingItem(
                  icon: Icons.live_help_outlined,
                  title: 'FAQs',
                  trailing: _buildArrowButton(),
                ),
                _buildSettingItem(
                  icon: Icons.headset_mic_rounded,
                  title: 'Contact Support',
                  trailing: _buildArrowButton(),
                ),
                _buildSettingItem(
                  icon: Icons.feedback_outlined,
                  title: 'Feedback',
                  trailing: _buildArrowButton(),
                ),
                const Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xBE565C63),
                ),

                // About Section
                _buildSectionHeader(
                  icon: Icons.article,
                  iconColor: const Color(0xFF04972E),
                  title: 'About',
                ),
                _buildSettingItem(
                  icon: Icons.feed_rounded,
                  title: 'Privacy Policy',
                  trailing: _buildArrowButton(),
                ),
                _buildSettingItem(
                  icon: Icons.manage_search_rounded,
                  title: 'Terms & Conditions',
                  trailing: _buildArrowButton(),
                ),
                _buildSettingItem(
                  icon: Icons.aod,
                  title: 'App Version',
                  trailing: const Text(
                    '2.3.1',
                    style: TextStyle(color: Color(0xFF00070C)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: const Color(0xFF000304),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 15, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: Icon(icon, color: const Color(0xFF000509), size: 24),
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color(0xFF000407),
                fontSize: 16,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildArrowButton() {
    return IconButton(
      icon: const Icon(
        Icons.keyboard_arrow_right_rounded,
        color: Color(0xFF0B0000),
        size: 30,
      ),
      onPressed: () {
        print('IconButton pressed ...');
      },
    );
  }
}
