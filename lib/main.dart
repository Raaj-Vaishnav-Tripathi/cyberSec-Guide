import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationSupportDirectory();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cyberSec Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

void _openWebView(BuildContext context, String url, String title) {
  if (Uri.tryParse(url)?.isAbsolute == true) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url, title: title),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid URL')),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Home')),
    const Center(child: Text('Courses')),
    const Center(child: Text('Help')),
    const Center(child: Text('Settings')),
  ];

  final List<String> _titles = ['Home', 'Courses', 'Help', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement search functionality
            },
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('Cybersecurity Basics'),
              ),
              const PopupMenuItem(
                child: Text('Network Security'),
              ),
              const PopupMenuItem(
                child: Text('Mobile Security'),
              ),
              const PopupMenuItem(
                child: Text('Threats'),
              ),
              const PopupMenuItem(
                child: Text('Vulnerabilities'),
              ),
              const PopupMenuItem(
                child: Text('Incident Management'),
              ),
              const PopupMenuItem(
                child: Text('Penetration Testing'),
              ),
              const PopupMenuItem(
                child: Text('Help'),
              ),
              const PopupMenuItem(
                child: Text('About'),
              ),
              const PopupMenuItem(
                child: Text('Contact Us'),
              ),
              const PopupMenuItem(
                child: Text('Settings'),
              ),
              const PopupMenuItem(
                child: Text('FAQs'),
              ),
            ],
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_top.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Cybersecurity Fundamentals'),
              leading: const Icon(Icons.security),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisco.com/c/en/us/products/security/what-is-cybersecurity.html',
                  'Cybersecurity Fundamentals',
                );
              },
            ),
            ListTile(
              title: const Text('Network Security'),
              leading: const Icon(Icons.security),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisco.com/c/en/us/products/security/network-security.html',
                  'Network Security',
                );
              },
            ),
            ListTile(
              title: const Text('Incident Management Plan'),
              leading: const Icon(Icons.warning),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisco.com/c/en/us/products/security/incident-response-plan.html',
                  'Incident Management Plan',
                );
              },
            ),
            ListTile(
              title: const Text('Third-Party Risk Management'),
              leading: const Icon(Icons.security),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisecurity.org/white-papers/third-party-risk-management/',
                  'Third-Party Risk Management',
                );
              },
            ),
            ListTile(
              title: const Text('Phishing Attacks'),
              leading: const Icon(Icons.security),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisco.com/c/en/us/products/security/what-is-phishing.html',
                  'Phishing Attacks',
                );
              },
            ),
            ListTile(
              title: const Text('Social Engineering'),
              leading: const Icon(Icons.group),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.cisco.com/c/en/us/products/security/what-is-social-engineering.html',
                  'Social Engineering',
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Security News'),
              leading: const Icon(Icons.article_outlined),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.darkreading.com/',
                  'Security News',
                );
              },
            ),
            ListTile(
              title: const Text('Cybersecurity Podcasts'),
              leading: const Icon(Icons.mic),
              onTap: () {
                _openWebView(
                  context,
                  'https://www.tripwire.com/state-of-security/security-awareness/top-10-cybersecurity-podcasts/',
                  'Cybersecurity Podcasts',
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Welcome to CyberSec Guide!')),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Set the title in the app bar
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
              if (widget.title == "Incident Management Plan") {
                _controller.evaluateJavascript(
                    "document.title='Incident Management Plan'");
              } else if (widget.title == "Third-Party Risk Management") {
                _controller.evaluateJavascript(
                    "document.title='Third-Party Risk Management'");
              }
            },
            onWebViewCreated: (controller) {
              _controller = controller;
            },
          ),
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
