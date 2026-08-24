import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:onest_all_router_app/viewmodels/login_viewmodel.dart';
import 'package:onest_all_router_app/core/service/basic_auth/router_status_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Wi-Fi state
  bool _showWifiPassword = false;

  // Blocked devices list state
  final List<Map<String, String>> _blockedDevices = [];

  // Connection type radio state
  String _selectedConnectionType = 'DHCP'; // 'DHCP', 'Static IP', 'PPPoE'

  // Security scan state
  bool _isScanningSecurity = false;
  double _securityProgress = 0.0;
  int? _securityScore;

  // Family / Parental Control state
  bool _parentalControlEnabled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewmodel>(context);
    final status = viewModel.routerStatus;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      drawer: _buildSideDrawer(context, viewModel, status),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.router_rounded,
                color: Color(0xFF38BDF8),
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Router Hub',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _sanitizeValue(status?.lanIp),
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new_rounded, color: Color(0xFFF87171)),
            tooltip: 'Logout',
            onPressed: () => _confirmLogout(context, viewModel),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF38BDF8),
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xFF94A3B8),
          labelStyle: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13),
          tabs: const [
            Tab(text: 'Network'),
            Tab(text: 'Security'),
            Tab(text: 'Family'),
            Tab(text: 'More'),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, child) {
          if (_tabController.index == 0) {
            return FloatingActionButton.extended(
              onPressed: () => _showAddBlockDeviceDialog(context),
              backgroundColor: const Color(0xFFDC2626),
              icon: const Icon(Icons.block_rounded, color: Colors.white),
              label: Text(
                'Block Device',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      body: status == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D29D4)),
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildNetworkTab(context, status),
                _buildSecurityTab(context, status),
                _buildFamilyTab(context),
                _buildMoreTab(context, viewModel, status),
              ],
            ),
    );
  }

  // ==========================================
  // SIDE MENU BAR (NAVIGATION DRAWER)
  // ==========================================
  Widget _buildSideDrawer(BuildContext context, LoginViewmodel viewModel, RouterStatus? status) {
    return Drawer(
      backgroundColor: const Color(0xFF0F172A),
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF1E293B),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: const Color(0xFF38BDF8).withAlpha(30),
                    child: const Icon(Icons.router_rounded, color: Color(0xFF38BDF8), size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          status?.ssid.isNotEmpty == true && status?.ssid != 'N/A' ? status!.ssid : 'Router Management',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _sanitizeValue(status?.lanIp),
                          style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFF94A3B8)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Side Menu Items
            _buildDrawerTile(
              icon: Icons.devices_other_rounded,
              iconColor: const Color(0xFF38BDF8),
              title: 'My Devices',
              onTap: () {
                Navigator.pop(context);
                _showMyDevicesModal(context, status);
              },
            ),
            _buildDrawerTile(
              icon: Icons.settings_rounded,
              iconColor: const Color(0xFFA855F7),
              title: 'App Settings',
              onTap: () {
                Navigator.pop(context);
                _showAppSettingsModal(context);
              },
            ),
            _buildDrawerTile(
              icon: Icons.help_center_rounded,
              iconColor: const Color(0xFF34D399),
              title: 'Support Center',
              onTap: () {
                Navigator.pop(context);
                _showSupportCenterModal(context);
              },
            ),

            const Spacer(),
            const Divider(color: Color(0xFF334155)),
            _buildDrawerTile(
              icon: Icons.logout_rounded,
              iconColor: const Color(0xFFF87171),
              title: 'Logout',
              onTap: () {
                Navigator.pop(context);
                _confirmLogout(context, viewModel);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withAlpha(25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF64748B), size: 20),
      onTap: onTap,
    );
  }

  // ==========================================
  // TAB 1: NETWORK TAB
  // ==========================================
  Widget _buildNetworkTab(BuildContext context, RouterStatus status) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Network Status Card
          _buildCardHeader('Network Status', Icons.info_rounded, const Color(0xFF2563EB)),
          const SizedBox(height: 10),
          _buildCardContainer([
            _buildDetailRow('Router Model Name', _sanitizeValue(status.hardwareVersion != 'N/A' ? status.hardwareVersion : (status.ssid != 'N/A' ? status.ssid : null))),
            _buildDetailRow('MAC Address', _sanitizeValue(status.lanMac)),
            _buildDetailRow('IP Address', _sanitizeValue(status.lanIp)),
            _buildDetailRow('Hardware Version', _sanitizeValue(status.hardwareVersion)),
            _buildDetailRow('Firmware Version', _sanitizeValue(status.firmwareVersion)),
          ]),

          const SizedBox(height: 20),

          // 2. Client Card
          _buildCardHeader('Connected Clients', Icons.devices_rounded, const Color(0xFF059669)),
          const SizedBox(height: 10),
          _buildCardContainer(
            Provider.of<LoginViewmodel>(context).connectedClients.isEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'No connected clients found.',
                          style: GoogleFonts.outfit(color: const Color(0xFF94A3B8)),
                        ),
                      ),
                    ),
                  ]
                : Provider.of<LoginViewmodel>(context).connectedClients.map((client) {
                    return _buildClientItem(
                      _sanitizeValue(client.hostname),
                      _sanitizeValue(client.ip),
                      _sanitizeValue(client.connType),
                      client.connType.contains('wifi') ? Icons.wifi_rounded : Icons.lan_rounded,
                      const Color(0xFF3B82F6),
                    );
                  }).toList(),
          ),

          const SizedBox(height: 20),

          // 3. Wi-Fi Settings Card
          _buildCardHeader('Wi-Fi Settings', Icons.wifi_lock_rounded, const Color(0xFF7C3AED)),
          const SizedBox(height: 10),
          Builder(
            builder: (context) {
              final vm = Provider.of<LoginViewmodel>(context);
              final realPass = vm.wifiSettings?.wifi2g?.password ?? vm.wifiSettings?.wifi5g?.password;
              final displayPass = _sanitizeValue(realPass);

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Network Name (SSID)', _sanitizeValue(status.ssid)),
                    const Divider(color: Color(0xFFE2E8F0)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Password', style: GoogleFonts.outfit(fontSize: 13, color: const Color(0xFF64748B))),
                          Row(
                            children: [
                              Text(
                                _showWifiPassword ? displayPass : '••••••••••••',
                                style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showWifiPassword = !_showWifiPassword;
                                  });
                                },
                                child: Icon(
                                  _showWifiPassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                                  size: 18,
                                  color: const Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _shareWifiCredentials(context, _sanitizeValue(status.ssid), displayPass),
                        icon: const Icon(Icons.share_rounded, size: 18),
                        label: Text('Share Wi-Fi Credentials', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // 4. Block List Card
          _buildCardHeader('Block List', Icons.block_rounded, const Color(0xFFDC2626)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Blocked Devices (${_blockedDevices.length})',
                      style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                    ),
                    TextButton.icon(
                      onPressed: () => _showAddBlockDeviceDialog(context),
                      icon: const Icon(Icons.add_rounded, size: 16, color: Color(0xFFDC2626)),
                      label: Text('Add User', style: GoogleFonts.outfit(color: const Color(0xFFDC2626), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (_blockedDevices.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'No blocked devices.',
                        style: GoogleFonts.outfit(color: const Color(0xFF94A3B8)),
                      ),
                    ),
                  )
                else
                  Column(
                    children: _blockedDevices.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFCA5A5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF991B1B)),
                                ),
                                Text(
                                  'MAC: ${item['mac']} | ${item['blockedAt']}',
                                  style: GoogleFonts.outfit(fontSize: 11, color: const Color(0xFFB91C1C)),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline_rounded, color: Color(0xFFDC2626)),
                              onPressed: () {
                                setState(() {
                                  _blockedDevices.remove(item);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // TAB 2: SECURITY TAB
  // ==========================================
  Widget _buildSecurityTab(BuildContext context, RouterStatus status) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Security Scan Button & Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shield_outlined, color: Color(0xFF818CF8), size: 32),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Router Security Audit',
                            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            _securityScore != null
                                ? 'Security Score: $_securityScore / 100'
                                : 'Run a full scan to audit open ports & vulnerability status.',
                            style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFFCBD5E1)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (_isScanningSecurity) ...[
                  LinearProgressIndicator(
                    value: _securityProgress,
                    backgroundColor: const Color(0xFF334155),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF818CF8)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Scanning router firewalls & encryption... ${(_securityProgress * 100).toInt()}%',
                    style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFF94A3B8)),
                  ),
                ] else ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _startSecurityScan,
                      icon: const Icon(Icons.security_rounded, size: 20),
                      label: Text('Run Security Scan', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F46E5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Security Column Items:
          // 1. Public IP Lookup Card
          _buildSecurityLookupCard(
            title: 'Public IP Lookup',
            icon: Icons.public_rounded,
            iconColor: const Color(0xFF0284C7),
            value: _sanitizeValue(status.wanIp),
            subtitle: 'Gateway: ${_sanitizeValue(status.defaultGateway)}',
            onTap: () => _showLookupDetails(context, 'Public IP Lookup', 'WAN IP: ${_sanitizeValue(status.wanIp)}\nGateway: ${_sanitizeValue(status.defaultGateway)}\nDNS: ${_sanitizeValue(status.dnsServers)}'),
          ),
          const SizedBox(height: 14),

          // 2. MAC Lookup Card
          _buildSecurityLookupCard(
            title: 'MAC Address Vendor Lookup',
            icon: Icons.search_rounded,
            iconColor: const Color(0xFF7C3AED),
            value: _sanitizeValue(status.lanMac),
            subtitle: 'LAN MAC: ${_sanitizeValue(status.lanMac)}',
            onTap: () => _showLookupDetails(context, 'MAC Vendor Lookup', 'MAC: ${_sanitizeValue(status.lanMac)}\nWireless MAC: ${_sanitizeValue(status.wirelessMac)}\nWAN MAC: ${_sanitizeValue(status.wanMac)}'),
          ),
          const SizedBox(height: 14),

          // 3. Antivirus Card
          _buildSecurityLookupCard(
            title: 'Router Antivirus & Protection',
            icon: Icons.verified_user_rounded,
            iconColor: const Color(0xFF059669),
            value: 'Real-time Firewall & Shield',
            subtitle: 'Active Gateway Protection (${_sanitizeValue(status.lanIp)})',
            onTap: () => _showLookupDetails(context, 'Antivirus Status', 'Gateway IP: ${_sanitizeValue(status.lanIp)}\nFirewall Engine: Active\nMalware Protection: Active'),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityLookupCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required String value,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iconColor.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(
          title,
          style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(value, style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: iconColor)),
            Text(subtitle, style: GoogleFonts.outfit(fontSize: 11, color: const Color(0xFF64748B))),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF94A3B8)),
        onTap: onTap,
      ),
    );
  }

  // ==========================================
  // TAB 3: FAMILY TAB
  // ==========================================
  Widget _buildFamilyTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Enable Parental Controls Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF047857), Color(0xFF065F46)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.family_restroom_rounded, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        Text(
                          'Parental Controls',
                          style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    Switch(
                      value: _parentalControlEnabled,
                      activeThumbColor: Colors.white,
                      activeTrackColor: const Color(0xFF34D399),
                      onChanged: (val) {
                        setState(() {
                          _parentalControlEnabled = val;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  _parentalControlEnabled
                      ? 'Parental controls are active. Bedtime schedules & content filtering enforced.'
                      : 'Enable parental controls to restrict screen time and block inappropriate content.',
                  style: GoogleFonts.outfit(fontSize: 13, color: const Color(0xFFA7F3D0)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          _buildCardHeader('Family Features', Icons.child_care_rounded, const Color(0xFF059669)),
          const SizedBox(height: 10),

          _buildCardContainer([
            _buildDetailRow('Bedtime Schedule', 'N/A'),
            _buildDetailRow('SafeSearch Enforcement', _parentalControlEnabled ? 'Enabled' : 'Disabled'),
            _buildDetailRow('Blocked Categories', 'N/A'),
          ]),
        ],
      ),
    );
  }

  // ==========================================
  // TAB 4: MORE TAB
  // ==========================================
  Widget _buildMoreTab(BuildContext context, LoginViewmodel viewModel, RouterStatus status) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Internet Connection Card
          _buildCardHeader('Internet Connection', Icons.public_rounded, const Color(0xFF2563EB)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IPv4 Connection',
                  style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Internet Connection Type',
                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF64748B)),
                ),
                const SizedBox(height: 6),

                // Connection Type Selector
                _buildRadioOptionTile('Dynamic IP (DHCP)', 'DHCP'),
                _buildRadioOptionTile('Static IP', 'Static IP'),
                _buildRadioOptionTile('PPPoE', 'PPPoE'),

                const Divider(color: Color(0xFFE2E8F0)),
                _buildDetailRow('IP Address', _sanitizeValue(status.wanIp)),
                _buildDetailRow('Default Gateway', _sanitizeValue(status.defaultGateway)),
                _buildDetailRow('Primary DNS', _sanitizeValue(status.dnsServers)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 2. System Card
          _buildCardHeader('System Management', Icons.settings_system_daydream_rounded, const Color(0xFF475569)),
          const SizedBox(height: 10),
          _buildCardContainer([
            _buildControlTile(
              icon: Icons.account_circle_rounded,
              iconColor: const Color(0xFF2563EB),
              title: 'Login Account',
              subtitle: 'Change router management password',
              onTap: () => _showAccountDialog(context),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            _buildControlTile(
              icon: Icons.backup_rounded,
              iconColor: const Color(0xFF059669),
              title: 'Backup Configuration',
              subtitle: 'Export or restore router settings backup file',
              onTap: () => _showBackupDialog(context),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            _buildControlTile(
              icon: Icons.restart_alt_rounded,
              iconColor: const Color(0xFFD97706),
              title: 'Reboot Device',
              subtitle: 'Restart hardware router system',
              onTap: () => _confirmReboot(context),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            _buildControlTile(
              icon: Icons.restore_rounded,
              iconColor: const Color(0xFFDC2626),
              title: 'Factory Default Restore',
              subtitle: 'Reset router settings back to factory default',
              onTap: () => _confirmFactoryReset(context),
            ),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
            _buildControlTile(
              icon: Icons.logout_rounded,
              iconColor: const Color(0xFFE11D48),
              title: 'Logout',
              subtitle: 'End local router management session',
              onTap: () => _confirmLogout(context, viewModel),
            ),
          ]),
        ],
      ),
    );
  }

  // ==========================================
  // HELPER WIDGETS & MODAL DIALOGS
  // ==========================================
  Widget _buildRadioOptionTile(String label, String value) {
    final isSelected = _selectedConnectionType == value;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedConnectionType = value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF2563EB) : const Color(0xFF94A3B8),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _buildCardContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(children: children),
    );
  }

  String _sanitizeValue(String? val) {
    if (val == null) return 'N/A';
    final trimmed = val.trim();
    if (trimmed.isEmpty ||
        trimmed == '0.0.0.0' ||
        trimmed == '00:00:00:00:00:00' ||
        trimmed == '00-00-00-00-00-00' ||
        trimmed == '00:00:00:00:00:00:00:00' ||
        trimmed.toLowerCase() == 'unknown' ||
        trimmed.toLowerCase() == 'null' ||
        trimmed.toLowerCase() == 'n/a' ||
        trimmed == '0') {
      return 'N/A';
    }
    return trimmed;
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.outfit(fontSize: 13, color: const Color(0xFF64748B))),
          Text(
            _sanitizeValue(value),
            style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B)),
          ),
        ],
      ),
    );
  }

  Widget _buildClientItem(String name, String ip, String connType, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withAlpha(25),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                Text('$ip | $connType', style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFF64748B))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withAlpha(25),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
      subtitle: Text(subtitle, style: GoogleFonts.outfit(fontSize: 11, color: const Color(0xFF64748B))),
      trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
      onTap: onTap,
    );
  }

  // Security Scan logic
  void _startSecurityScan() async {
    setState(() {
      _isScanningSecurity = true;
      _securityProgress = 0.0;
      _securityScore = null;
    });

    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        setState(() {
          _securityProgress = i / 10.0;
        });
      }
    }

    if (mounted) {
      setState(() {
        _isScanningSecurity = false;
        _securityScore = 98;
      });
    }
  }

  // Modals & Dialogs
  void _shareWifiCredentials(BuildContext context, String ssid, String password) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Share Wi-Fi Network', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('SSID: $ssid', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('Password: $password', style: GoogleFonts.outfit(fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: 'Wi-Fi SSID: $ssid\nPassword: $password'));
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Wi-Fi credentials copied to clipboard!', style: GoogleFonts.outfit())),
                );
              },
              icon: const Icon(Icons.copy_rounded),
              label: Text('Copy Credentials', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7C3AED), foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddBlockDeviceDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final macCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Block User Device', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'Device Name / Alias', labelStyle: GoogleFonts.outfit()),
            ),
            TextField(
              controller: macCtrl,
              decoration: InputDecoration(labelText: 'MAC Address (e.g. AA:BB:CC:DD:EE:FF)', labelStyle: GoogleFonts.outfit()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: GoogleFonts.outfit())),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty) {
                setState(() {
                  _blockedDevices.add({
                    'name': nameCtrl.text.trim(),
                    'mac': macCtrl.text.trim().isEmpty ? 'N/A' : macCtrl.text.trim(),
                    'blockedAt': 'Just now',
                  });
                });
              }
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626)),
            child: Text('Block Device', style: GoogleFonts.outfit(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showLookupDetails(BuildContext context, String title, String details) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Text(details, style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Close', style: GoogleFonts.outfit())),
        ],
      ),
    );
  }

  void _showMyDevicesModal(BuildContext context, RouterStatus? status) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Router Devices', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.router_rounded, color: Color(0xFF2563EB)),
              title: Text(status?.ssid.isNotEmpty == true ? status!.ssid : 'Active Router', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
              subtitle: Text('${status?.lanIp} (Connected)', style: GoogleFonts.outfit(color: const Color(0xFF059669))),
              trailing: const Icon(Icons.check_circle_rounded, color: Color(0xFF059669)),
            ),
          ],
        ),
      ),
    );
  }

  void _showAppSettingsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('App Settings', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text('Auto Reconnect to Gateway', style: GoogleFonts.outfit()),
              value: true,
              onChanged: (_) {},
            ),
            SwitchListTile(
              title: Text('Push Security Alerts', style: GoogleFonts.outfit()),
              value: true,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }

  void _showSupportCenterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Support Center', style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.help_outline_rounded, color: Color(0xFF2563EB)),
              title: Text('Router Setup FAQs', style: GoogleFonts.outfit()),
            ),
            ListTile(
              leading: const Icon(Icons.bug_report_outlined, color: Color(0xFFD97706)),
              title: Text('Export Diagnostic Logs', style: GoogleFonts.outfit()),
            ),
          ],
        ),
      ),
    );
  }

  void _showAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Login Account', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Text('Change your router administrator username and password.', style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Close', style: GoogleFonts.outfit())),
        ],
      ),
    );
  }

  void _showBackupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Backup & Restore', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Text('Export current router settings configuration file.', style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Close', style: GoogleFonts.outfit())),
        ],
      ),
    );
  }

  void _confirmReboot(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Reboot Router', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Text('Are you sure you want to reboot the router device?', style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: GoogleFonts.outfit())),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Rebooting router...', style: GoogleFonts.outfit()), backgroundColor: const Color(0xFFD97706)),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD97706)),
            child: Text('Reboot', style: GoogleFonts.outfit(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmFactoryReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Factory Default Restore', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: const Color(0xFFDC2626))),
        content: Text('WARNING: This will reset all router configurations back to factory defaults. Proceed with caution.', style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: GoogleFonts.outfit())),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Factory reset initiated...', style: GoogleFonts.outfit()), backgroundColor: const Color(0xFFDC2626)),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626)),
            child: Text('Restore Factory Defaults', style: GoogleFonts.outfit(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context, LoginViewmodel viewModel) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Logout', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        content: Text('Are you sure you want to logout from the router management session?', style: GoogleFonts.outfit()),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Cancel', style: GoogleFonts.outfit())),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626)),
            child: Text('Logout', style: GoogleFonts.outfit(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
