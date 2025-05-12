import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const SecureSniffApp());
}

class SecureSniffApp extends StatelessWidget {
  const SecureSniffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecureSniff',
      theme: ThemeData(
        primaryColor: const Color(0xFF00FF80), // Neon green
        scaffoldBackgroundColor: const Color(0xFF121212), // Dark background
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00FF80),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1E1E1E),
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const SecureSniffHome(),
    );
  }
}

class SecureSniffHome extends StatefulWidget {
  const SecureSniffHome({super.key});

  @override
  State<SecureSniffHome> createState() => _SecureSniffHomeState();
}

class _SecureSniffHomeState extends State<SecureSniffHome> {
  final TextEditingController _ssidController = TextEditingController();
  String _result = 'Enter an SSID to start auditing';
  bool _isLoading = false;

  // Simulated wordlist (for demo purposes)
  final List<String> _wordlist = [
    'admin123',
    'password123',
    'testwifi',
    '12345678'
  ];

  @override
  void initState() {
    super.initState();
    _showDisclaimer();
  }

  void _showDisclaimer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: Text(
            'Ethical Use Disclaimer',
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'SecureSniff is for educational use only. This demo simulates WiFi auditing locally.',
            style: GoogleFonts.roboto(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'I Understand',
                style: GoogleFonts.roboto(color: const Color(0xFF00FF80)),
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<void> _auditWiFi() async {
    if (_ssidController.text.isEmpty) {
      setState(() {
        _result = 'Please enter a valid SSID';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _result = 'Auditing WiFi...';
    });

    // Simulate auditing delay (like backend processing)
    await Future.delayed(const Duration(seconds: 2));

    // Simulate password check (random match for demo)
    final String? password = _wordlist.contains(_ssidController.text)
        ? _wordlist[DateTime.now().millisecond % _wordlist.length]
        : null;

    setState(() {
      _isLoading = false;
      _result = password != null
          ? 'Success! Password: $password (Simulated)'
          : 'No passwords matched. (Simulated)';
    });
  }

  void _showAboutResearch() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(
          'About SecureSniff',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'SecureSniff simulates WiFi password auditing to highlight security gaps in campus networks. Part of blockchain-based WiFi security research at South Eastern University of Sri Lanka.',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: GoogleFonts.roboto(color: const Color(0xFF00FF80)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecureSniff',
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E1E1E),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Color(0xFF00FF80)),
            onPressed: _showAboutResearch,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SecureSniff',
                  style: GoogleFonts.roboto(
                    fontSize: 32,
                    color: const Color(0xFF00FF80),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'WiFi Security',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF00FF80),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _ssidController,
                style: GoogleFonts.roboto(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'WiFi SSID',
                  prefixIcon: const Icon(Icons.wifi, color: Color(0xFF00FF80)),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _auditWiFi,
                  child: _isLoading
                      ? const SpinKitFadingCircle(color: Colors.black, size: 24)
                      : Text('Start Audit', style: GoogleFonts.roboto()),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Result: $_result',
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
