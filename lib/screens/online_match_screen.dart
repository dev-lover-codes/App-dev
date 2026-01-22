import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/app_theme.dart';

class OnlineMatchScreen extends StatefulWidget {
  const OnlineMatchScreen({super.key});

  @override
  State<OnlineMatchScreen> createState() => _OnlineMatchScreenState();
}

class _OnlineMatchScreenState extends State<OnlineMatchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock Data
  String? _foundUser;
  bool _isSearching = false;
  bool _isOnline = true; // Status of found user

  // QR Timer
  int _qrTimer = 30;
  Timer? _timer;
  String _qrData = "USER_RAAJ_TOKEN_1";

  @override
  void dispose() {
    _timer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _startQRTimer() {
    _qrTimer = 30;
    _qrData = "USER_RAAJ_TOKEN_${DateTime.now().millisecondsSinceEpoch}";
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_qrTimer > 0) {
            _qrTimer--;
          } else {
            // Refresh QR
            _qrTimer = 30;
            _qrData =
                "USER_RAAJ_TOKEN_${DateTime.now().millisecondsSinceEpoch}";
          }
        });
      }
    });
  }

  void _searchUser() async {
    if (_searchController.text.isEmpty) return;
    setState(() {
      _isSearching = true;
      _foundUser = null;
    });

    // Simulate API search latency
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));

    setState(() {
      _foundUser = "Player_${_searchController.text}";
      _isOnline = true; // Mock status
      _isSearching = false;
    });
  }

  void _sendInvite() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Invite sent to $_foundUser!"),
        backgroundColor: AppTheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _copyInviteLink() {
    Clipboard.setData(
      const ClipboardData(text: "https://tictactoe.app/join/room/123456"),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Invite Link copied to clipboard!"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showMyQRCode(BuildContext context) {
    _startQRTimer();
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Secure Connection", style: AppTheme.headingStyle),
                    const SizedBox(height: 5),
                    Text(
                      "Scan to join lobby",
                      style: AppTheme.bodyStyle.copyWith(color: Colors.white54),
                    ),
                    const SizedBox(height: 20),

                    // QR Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          QrImageView(
                            data: _qrData,
                            version: QrVersions.auto,
                            size: 200.0,
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Refreshing in $_qrTimer s",
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Game Mode: Ranked",
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
            );
          },
        );
      },
    ).then((_) => _timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Multiplayer Lobby"),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: Column(
          children: [
            // 1. Interactive Radar
            SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                          width: 150 + (i * 50).toDouble(),
                          height: 150 + (i * 50).toDouble(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        )
                        .animate(onPlay: (c) => c.repeat())
                        .scale(
                          duration: 2.seconds,
                          delay: (i * 500).ms,
                          begin: const Offset(0.5, 0.5),
                          end: const Offset(1.2, 1.2),
                        )
                        .fadeOut(delay: (i * 500).ms, duration: 2.seconds),

                  const Icon(Icons.public, size: 60, color: Colors.white),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      "ID: PLAYER_1",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2. Control Panel
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Invite Link
                    GestureDetector(
                      onTap: _copyInviteLink,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppTheme.secondaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.link, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Share Invite Link",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate().shimmer(delay: 2.seconds, duration: 1.seconds),

                    const SizedBox(height: 25),
                    Text(
                      "Connect Locally",
                      style: AppTheme.headingStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            context,
                            icon: Icons.qr_code_2,
                            label: "Show QR",
                            color: AppTheme.primary,
                            onTap: () => _showMyQRCode(context),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildActionButton(
                            context,
                            icon: Icons.camera_alt_outlined,
                            label: "Scan QR",
                            color: AppTheme.accent,
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Scanner opening..."),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),
                    Text(
                      "Global Search",
                      style: AppTheme.headingStyle.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 15),

                    // Search Bar
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Username or User ID...",
                              hintStyle: const TextStyle(color: Colors.white38),
                              filled: true,
                              fillColor: Colors.black26,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white38,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: _searchUser,
                          style: IconButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                          ),
                          icon: _isSearching
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 18,
                                ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Search Result Card
                    if (_foundUser != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.primary.withOpacity(0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppTheme.primary,
                                  child: Text(
                                    _foundUser![7],
                                    style: const TextStyle(color: Colors.white),
                                  ), // Get 1st letter
                                ),
                                if (_isOnline)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.greenAccent,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _foundUser!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Online . Mutual Friends: 2",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _sendInvite,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.accent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              child: const Text("Invite"),
                            ),
                          ],
                        ),
                      ).animate().slideX(begin: 0.1, end: 0, duration: 300.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
