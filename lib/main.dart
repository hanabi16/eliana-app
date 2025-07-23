import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hardware Ordering System',
      theme: ThemeData(
        primarySwatch: Colors.amber, 
        primaryColor: const Color(0xFFFDD835), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFDD835),
          foregroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white, 
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200], 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFFDD835), width: 2), 
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black, 
          selectedItemColor: Color(0xFFFDD835), 
          unselectedItemColor: Colors.white, 
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: const Color(0xFFFDD835)),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
  
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            
                Icon(
                  Icons.handyman,
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 32),
                Text(
                  'Login to Eliana Hardware Trading',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email / Mobile Number',
                    prefixIcon: Icon(Icons.person), 
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or mobile number';
                    }
                    
                    if (!value.contains('@') && value.length < 10) { 
                      return 'Please enter a valid email or 10-digit mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50), 
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Forgot Password?')),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('OR', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                  
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logging in with Facebook (Simulated)')),
                    );
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('Login with Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
    
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing up...')),
      );
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerificationPage(emailOrMobile: _emailController.text.isNotEmpty ? _emailController.text : _mobileController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create Your Account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                 const SizedBox(height: 32),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (_emailController.text.isEmpty && (value == null || value.isEmpty)) {
                      return 'Please enter a mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signing up with Facebook (Simulated)')),
                    );
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('Sign Up with Facebook'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpVerificationPage extends StatefulWidget {
  final String emailOrMobile;
  const OtpVerificationPage({super.key, required this.emailOrMobile});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _verifyOtp() {
    if (_formKey.currentState!.validate()) {
  
      if (_otpController.text == '123456') { 
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account verified successfully!')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter OTP sent to ${widget.emailOrMobile}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    hintText: 'e.g., 123456',
                    counterText: '', 
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the OTP';
                    }
                    if (value.length != 6 || int.tryParse(value) == null) {
                      return 'Please enter a 6-digit number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Verify Account',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Resending OTP...')),
                    );
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    CartPage(),
    const NotificationsPage(),
    const MessagingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messaging',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'All';

final List<Map<String, dynamic>> _allProducts = [
  {
    'id': 'p1',
    'name': 'Hammer',
    'description': 'Heavy duty claw hammer, perfect for construction and DIY projects. Ergonomic grip for comfortable use.',
    'price': 250.00,
    'category': 'Tools',
    'imageUrl': 'assets/images/hammer.png',
    'types': [
      {'type': 'Claw Hammer', 'brand': 'Stanley', 'price': 250.00, 'imageUrl': 'assets/images/hammer.png'},
      {'type': 'Ball Peen Hammer', 'brand': 'TEKTON', 'price': 300.00, 'imageUrl': 'assets/images/tekton.jpg'},
    ]
  },
  {
    'id': 'p2',
    'name': 'Screwdriver Set',
    'description': 'Precision screwdriver set with magnetic tips. Includes various sizes for electronics and general repairs.',
    'price': 350.00,
    'category': 'Tools',
    'imageUrl': 'assets/images/dewalt.jpg',
    'types': [
      {'type': 'Philips Set', 'brand': 'Craftsman', 'price': 350.00, 'imageUrl': 'assets/images/Philips.jpg'},
      {'type': 'Flathead Set', 'brand': 'DeWalt', 'price': 300.00, 'imageUrl': 'assets/images/dewalt.jpg'},
    ]
  },
  {
    'id': 'p3',
    'name': 'Measuring Tape',
    'description': '10-meter steel measuring tape with auto-lock feature. Durable case and clear markings.',
    'price': 150.00,
    'category': 'Measurement',
    'imageUrl': 'assets/images/stanleytape.jpeg',
    'types': [
      {'type': '10-meter Tape', 'brand': 'Stanley', 'price': 150.00, 'imageUrl': 'assets/images/stanleytape.jpeg'},
      {'type': '5-meter Tape', 'brand': 'Milwaukee', 'price': 100.00, 'imageUrl': 'assets/images/milwaukee.jpg'},
    ]
  },
  {
    'id': 'p4',
    'name': 'Drill Machine',
    'description': 'Cordless electric drill with multiple speed settings. Ideal for drilling into wood, metal, and plastic.',
    'price': 2500.00,
    'category': 'Power Tools',
    'imageUrl': 'assets/images/boschdrill.jpeg',
    'types': [
      {'type': 'Cordless Drill', 'brand': 'Bosch', 'price': 2500.00, 'imageUrl': 'assets/images/boschdrill.jpeg'},
      {'type': 'Impact Driver', 'brand': 'Makita', 'price': 2800.00, 'imageUrl': 'assets/images/makitadriver.jpg'},
    ]
  },
  {
    'id': 'p5',
    'name': 'Paint Brush Set',
    'description': 'Assorted paint brush set for various painting needs. Easy to clean and durable bristles.',
    'price': 180.00,
    'category': 'Painting',
    'imageUrl': 'assets/images/PGBRUSH.jpeg',
    'types': [
      {'type': 'Bristle Brush Set', 'brand': 'Pro-Grade', 'price': 180.00, 'imageUrl': 'assets/images/PGBRUSH.jpeg'},
      {'type': 'Foam Brush Set', 'brand': 'Wooster', 'price': 120.00, 'imageUrl': 'assets/images/wooster.jpg'},
    ]
  },
  {
    'id': 'p6',
    'name': 'Safety Gloves',
    'description': 'Cut-resistant safety gloves for protection during heavy-duty work. Comfortable and breathable.',
    'price': 100.00,
    'category': 'Safety',
    'imageUrl': 'assets/images/mechanix.jpg',
    'types': [
      {'type': 'Cut-Resistant Gloves', 'brand': 'Mechanix', 'price': 100.00, 'imageUrl': 'assets/images/mechanix.jpg'},
      {'type': 'Leather Work Gloves', 'brand': 'Carhartt', 'price': 150.00, 'imageUrl': 'assets/images/leathergloves.jpg'},
    ]
  },
  {
    'id': 'p7',
    'name': 'Wrench Set',
    'description': 'Adjustable wrench set with chrome vanadium steel construction. Essential for plumbing and automotive tasks.',
    'price': 800.00,
    'category': 'Tools',
    'imageUrl': 'assets/images/gearwrench.jpg',
    'types': [
      {'type': 'Combination Wrench Set', 'brand': 'GearWrench', 'price': 800.00, 'imageUrl': 'assets/images/gearwrench.jpg'},
      {'type': 'Adjustable Wrench', 'brand': 'Crescent', 'price': 400.00, 'imageUrl': 'assets/images/crescent.jpg'},
    ]
  },
  {
    'id': 'p8',
    'name': 'LED Light Bulb',
    'description': 'Energy-saving LED bulb (E27) with warm white light. Long-lasting and environmentally friendly.',
    'price': 80.00,
    'category': 'Electrical',
    'imageUrl': 'assets/images/e27.jpg',
    'types': [
      {'type': 'E27 Warm White', 'brand': 'Philips', 'price': 80.00, 'imageUrl': 'assets/images/e27.jpg'},
      {'type': 'Gu10 Cool White', 'brand': 'Osram', 'price': 90.00, 'imageUrl': 'assets/images/osram.jpg'},
    ]
  },
  {
    'id': 'p9',
    'name': 'Garden Hose',
    'description': '50-foot flexible garden hose, kink-free design. Perfect for watering plants and cleaning outdoor areas.',
    'price': 750.00,
    'category': 'Gardening',
    'imageUrl': 'assets/images/flexzilla.jpg',
    'types': [
      {'type': '50ft Flexible Hose', 'brand': 'Flexzilla', 'price': 750.00, 'imageUrl': 'assets/images/flexzilla.jpg'},
      {'type': '100ft Heavy Duty Hose', 'brand': 'Goodyear', 'price': 1100.00, 'imageUrl': 'assets/images/goodyear.jpg'},
    ]
  },
  {
    'id': 'p10',
    'name': 'Adhesive Tape',
    'description': 'Strong clear adhesive tape for various household and office uses. Reliable and easy to tear.',
    'price': 60.00,
    'category': 'Hardware',
    'imageUrl': 'assets/images/scotch.jpeg',
    'types': [
      {'type': 'Clear Packing Tape', 'brand': 'Scotch', 'price': 60.00, 'imageUrl': 'assets/images/scotch.jpeg'},
      {'type': 'Duct Tape', 'brand': 'Gorilla', 'price': 120.00, 'imageUrl': 'assets/images/gorilla.jpg'},
    ]
  },
  {
    'id': 'p11',
    'name': 'Sand',
    'description': 'Washed fine sand, suitable for concrete mixing, plastering, and general construction.',
    'price': 500.00,
    'category': 'Construction Materials',
    'imageUrl': 'assets/images/finesand.jpg',
    'unit': 'cubic meter',
    'types': [
      {'type': 'Fine Sand', 'brand': 'Local', 'price': 500.00, 'imageUrl': 'assets/images/finesand.jpg'},
      {'type': 'Washed Sand', 'brand': 'Premium', 'price': 600.00, 'imageUrl': 'assets/images/washedsand.jpg'},
    ]
  },
  {
    'id': 'p12',
    'name': 'Gravel',
    'description': 'Crushed gravel, ideal for drainage, driveways, and concrete aggregate.',
    'price': 650.00,
    'category': 'Construction Materials',
    'imageUrl': 'assets/images/localgravel.jpg',
    'unit': 'cubic meter',
    'types': [
      {'type': '3/4" Gravel', 'brand': 'Local', 'price': 650.00, 'imageUrl': 'assets/images/localgravel.jpg'},
      {'type': '3/8" Gravel', 'brand': 'Premium', 'price': 700.00, 'imageUrl': 'assets/images/Pgravel.jpg'},
    ]
  },
  {
    'id': 'p13',
    'name': 'Cement',
    'description': 'Portland cement, strong and versatile for all construction applications.',
    'price': 220.00,
    'category': 'Construction Materials',
    'imageUrl': 'assets/images/portland.png',
    'unit': 'bag',
    'types': [
      {'type': 'Portland Cement', 'brand': 'Holcim', 'price': 220.00, 'imageUrl': 'assets/images/portland.png'},
      {'type': 'Rapid Hardening Cement', 'brand': 'Eagle', 'price': 250.00, 'imageUrl': 'assets/images/rapidcement.jpg'},
    ]
  },
  {
    'id': 'p14',
    'name': 'Hollow Blocks',
    'description': 'Standard concrete hollow blocks for wall construction.',
    'price': 12.00,
    'category': 'Construction Materials',
    'imageUrl': 'assets/images/4inchHB.jpeg',
    'unit': 'piece',
    'types': [
      {'type': '4-inch Hollow Block', 'brand': 'Standard', 'price': 12.00, 'imageUrl': 'assets/images/4inchHB.jpeg'},
      {'type': '6-inch Hollow Block', 'brand': 'Heavy Duty', 'price': 15.00, 'imageUrl': 'assets/images/6inchHB.jpg'},
    ]
  },
];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'All', 'icon': Icons.category},
    {'name': 'Tools', 'icon': Icons.handyman},
    {'name': 'Measurement', 'icon': Icons.straighten},
    {'name': 'Power Tools', 'icon': Icons.power},
    {'name': 'Painting', 'icon': Icons.format_paint},
    {'name': 'Safety', 'icon': Icons.security},
    {'name': 'Electrical', 'icon': Icons.electrical_services},
    {'name': 'Gardening', 'icon': Icons.local_florist},
    {'name': 'Hardware', 'icon': Icons.hardware},
    {'name': 'Construction Materials', 'icon': Icons.construction}, 
  ];

  List<Map<String, dynamic>> get _filteredProducts {
    List<Map<String, dynamic>> products = _allProducts;

    if (_selectedCategory != 'All') {
      products = products.where((product) => product['category'] == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      products = products.where((product) {
        final query = _searchQuery.toLowerCase();
        final name = product['name'].toLowerCase();
        final description = product['description'].toLowerCase();
        final price = product['price'].toString(); 

        return name.contains(query) || description.contains(query) || price.contains(query);
      }).toList();
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliana Hardware Trading'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products by name, description or price...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = '';
                        });
                      },
                    )
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          avatar: Icon(category['icon'], size: 18), 
                          label: Text(category['name']),
                          selected: _selectedCategory == category['name'],
                          selectedColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: _selectedCategory == category['name'] ? Colors.black : Colors.black87,
                            fontWeight: _selectedCategory == category['name'] ? FontWeight.bold : FontWeight.normal,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = selected ? category['name'] : 'All';
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _filteredProducts.isEmpty
          ? Center(
        child: Text(
          'No products found for "$_searchQuery" in category "$_selectedCategory"',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, 
        ),
        itemCount: _filteredProducts.length,
        itemBuilder: (context, index) {
          final product = _filteredProducts[index];
          return GestureDetector( 
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: ProductGridItem(product: product),
          );
        },
      ),
    );
  }
}

class ProductGridItem extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset( 
                product['imageUrl'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.broken_image, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '₱${product['price'].toStringAsFixed(2)} ${product['unit'] ?? ''}', 
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product['description'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _quantity = 1.0; 
  late Map<String, dynamic> _selectedProductType;
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product.containsKey('types') && widget.product['types'].isNotEmpty) {
      _selectedProductType = widget.product['types'][0];
    } else {
      _selectedProductType = widget.product;
    }
    _quantityController.text = _quantity.toStringAsFixed(widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel') ? 1 : 0);
    _quantityController.addListener(_updateQuantityFromField);
  }

  @override
  void dispose() {
    _quantityController.removeListener(_updateQuantityFromField);
    _quantityController.dispose();
    super.dispose();
  }

  void _updateQuantityFromField() {
    final value = double.tryParse(_quantityController.text);
    if (value != null) {
      setState(() {
        _quantity = value;
      });
    }
  }

  void _incrementQuantity() {
    setState(() {
      if (widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel')) {
        _quantity += 0.5; 
      } else {
        _quantity++;
      }
      _quantityController.text = _quantity.toStringAsFixed(widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel') ? 1 : 0);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel')) {
        if (_quantity > 0.5) {
          _quantity -= 0.5; 
        } else {
          _quantity = 0.5; 
        }
      } else {
        if (_quantity > 1) {
          _quantity--;
        }
      }
      _quantityController.text = _quantity.toStringAsFixed(widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel') ? 1 : 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isConstructionMaterial = widget.product['category'] == 'Construction Materials';
    bool canAdjustByHalfCubic = isConstructionMaterial && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset( 
                _selectedProductType['imageUrl'] ?? widget.product['imageUrl'],
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.product['name'],
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '₱${_selectedProductType['price'].toStringAsFixed(2)}', 
              style: const TextStyle( 
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product['description'],
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 24),

            if (widget.product.containsKey('types') && widget.product['types'].isNotEmpty) ...[
              Text(
                'Select Type/Brand',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: widget.product['types'].map<Widget>((type) {
                  return ChoiceChip(
                    label: Text('${type['type']} (${type['brand']})'),
                    selected: _selectedProductType['type'] == type['type'] && _selectedProductType['brand'] == type['brand'],
                    selectedColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey[300],
                    labelStyle: TextStyle(
                      color: (_selectedProductType['type'] == type['type'] && _selectedProductType['brand'] == type['brand']) ? Colors.black : Colors.black87,
                      fontWeight: (_selectedProductType['type'] == type['type'] && _selectedProductType['brand'] == type['brand']) ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedProductType = type;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],

            Text(
              'Quantity (${widget.product['unit'] ?? 'pcs'})',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline, size: 30),
                  onPressed: _decrementQuantity,
                  color: Colors.black,
                ),
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.numberWithOptions(decimal: canAdjustByHalfCubic),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    inputFormatters: [
                      if (canAdjustByHalfCubic)
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}$')) 
                      else
                        FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      double? parsedValue = double.tryParse(value);
                      if (parsedValue != null) {
                        setState(() {
                          _quantity = parsedValue;
                        });
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, size: 30),
                  onPressed: _incrementQuantity,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${_quantity.toStringAsFixed(widget.product['category'] == 'Construction Materials' && (widget.product['name'] == 'Sand' || widget.product['name'] == 'Gravel') ? 1 : 0)}x ${_selectedProductType['type'] ?? widget.product['name']} added to cart!')),
                  );
                  CartPage.addToCart({
                    ...widget.product,
                    'type': _selectedProductType['type'] ?? widget.product['name'],
                    'brand': _selectedProductType['brand'],
                    'price': _selectedProductType['price'],
                    'imageUrl': _selectedProductType['imageUrl'] ?? widget.product['imageUrl'],
                  }, _quantity); 
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static final List<Map<String, dynamic>> _cartItems = [];

  static void addToCart(Map<String, dynamic> product, double quantity) {
    bool found = false;
    for (var item in _cartItems) {
      if (item['id'] == product['id'] && item['type'] == product['type'] && item['brand'] == product['brand']) {
        item['quantity'] = (item['quantity'] ?? 0.0) + quantity;
        found = true;
        break;
      }
    }
    if (!found) {
      _cartItems.add({...product, 'quantity': quantity, 'isSelected': true});
    }
  }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _currentCartItems = [];

  @override
  void initState() {
    super.initState();
    _currentCartItems = List.from(CartPage._cartItems);
  }

  void _toggleItemSelection(int index, bool? value) {
    setState(() {
      _currentCartItems[index]['isSelected'] = value ?? false;
    });
  }

  void _removeItem(int index) {
    setState(() {
      final removedItem = _currentCartItems.removeAt(index);
      CartPage._cartItems.removeWhere((item) => item['id'] == removedItem['id'] && item['type'] == removedItem['type'] && item['brand'] == removedItem['brand']);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from cart!')),
    );
  }

  void _incrementQuantity(int index) {
    setState(() {
      final item = _currentCartItems[index];
      if (item['category'] == 'Construction Materials' && (item['name'] == 'Sand' || item['name'] == 'Gravel')) {
        item['quantity'] = (item['quantity'] ?? 0.0) + 0.5;
      } else {
        item['quantity'] = (item['quantity'] ?? 0.0) + 1.0;
      }
      final itemToUpdate = CartPage._cartItems.firstWhere((cartItem) => cartItem['id'] == item['id'] && cartItem['type'] == item['type'] && cartItem['brand'] == item['brand']);
      itemToUpdate['quantity'] = item['quantity'];
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      final item = _currentCartItems[index];
      if (item['category'] == 'Construction Materials' && (item['name'] == 'Sand' || item['name'] == 'Gravel')) {
        if ((item['quantity'] ?? 0.0) > 0.5) {
          item['quantity'] = (item['quantity'] ?? 0.0) - 0.5;
        } else {
          item['quantity'] = 0.5; 
        }
      } else {
        if ((item['quantity'] ?? 0.0) > 1.0) {
          item['quantity'] = (item['quantity'] ?? 0.0) - 1.0;
        } else {
          _removeItem(index); 
          return;
        }
      }
      final itemToUpdate = CartPage._cartItems.firstWhere((cartItem) => cartItem['id'] == item['id'] && cartItem['type'] == item['type'] && cartItem['brand'] == item['brand']);
      itemToUpdate['quantity'] = item['quantity'];
    });
  }

  double get _totalAmountDue {
    double total = 0.0;
    for (var item in _currentCartItems) {
      if (item['isSelected'] == true) {
        total += (item['price'] * (item['quantity'] ?? 0.0));
      }
    }
    return total;
  }

  void _checkout() {
    final selectedItems = _currentCartItems.where((item) => item['isSelected'] == true).toList();
    if (selectedItems.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckoutPage(selectedCartItems: selectedItems),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select items to checkout.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: _currentCartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  const Text(
                    'Your cart is empty!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _currentCartItems.length,
                    itemBuilder: (context, index) {
                      final item = _currentCartItems[index];
                      String quantityText;
                      if (item['category'] == 'Construction Materials' && (item['name'] == 'Sand' || item['name'] == 'Gravel')) {
                        quantityText = item['quantity'].toStringAsFixed(1);
                      } else {
                        quantityText = item['quantity'].toStringAsFixed(0);
                      }
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: item['isSelected'],
                                onChanged: (value) => _toggleItemSelection(index, value),
                                activeColor: Theme.of(context).primaryColor,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item['imageUrl'],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[300],
                                    child: Center(
                                      child: Icon(Icons.broken_image, color: Colors.grey[600]),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item['name']} - ${item['type']}', 
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '₱${item['price'].toStringAsFixed(2)}', 
                                      style: const TextStyle(color: Colors.black, fontSize: 14), 
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove_circle_outline),
                                          onPressed: () => _decrementQuantity(index),
                                        ),
                                        Text('$quantityText ${item['unit'] ?? ''}'), 
                                        IconButton(
                                          icon: const Icon(Icons.add_circle_outline),
                                          onPressed: () => _incrementQuantity(index),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeItem(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Amount Due:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₱${_totalAmountDue.toStringAsFixed(2)}', 
                            style: const TextStyle( 
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _checkout,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Checkout Selected Items',
                          style: TextStyle(fontSize: 18),
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

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> selectedCartItems;

  const CheckoutPage({super.key, required this.selectedCartItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _deliveryOption = 'pickup'; 
  DateTime? _selectedDate;
  List<String> _deliveryAddresses = ['Alangilan'];
  late String _currentSelectedAddress;

  @override
  void initState() {
    super.initState();
    _currentSelectedAddress = _deliveryAddresses[0];
  }

  bool get _canDeliver {
    bool hasConstructionMaterials = false;
    double totalOtherQuantity = 0;

    for (var item in widget.selectedCartItems) {
      if (item['category'] == 'Construction Materials') {
        hasConstructionMaterials = true;
        break;
      } else {
        totalOtherQuantity += item['quantity'];
      }
    }

    if (hasConstructionMaterials) {
      return true; 
    } else {
      return totalOtherQuantity >= 50; 
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor, 
              onPrimary: Colors.black,
              onSurface: Colors.black, 
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, 
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addNewAddress() {
    TextEditingController newAddressController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Delivery Address'),
          content: TextField(
            controller: newAddressController,
            decoration: const InputDecoration(
              labelText: 'New Address',
              hintText: 'Enter full delivery address',
            ),
            maxLines: 3,
            keyboardType: TextInputType.streetAddress,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (newAddressController.text.isNotEmpty) {
                  setState(() {
                    _deliveryAddresses.add(newAddressController.text);
                    _currentSelectedAddress = newAddressController.text; 
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('New address added and selected!')),
                  );
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Address cannot be empty.')),
                  );
                }
              },
              child: const Text('Add Address'),
            ),
          ],
        );
      },
    );
  }

  void _placeOrder() {
    if (_deliveryOption == 'delivery') {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a delivery date.')),
        );
        return;
      }

      for (var item in widget.selectedCartItems) {
        if (item['category'] == 'Construction Materials') {
          if (item['name'] == 'Sand' && item['quantity'] < 1.0) { 
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sand requires a minimum of 1 cubic meter for delivery.')),
            );
            return;
          }
          if (item['name'] == 'Gravel' && item['quantity'] < 1.0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Gravel requires a minimum of 1 cubic meter for delivery.')),
            );
            return;
          }
          if (item['name'] == 'Cement' && item['quantity'] < 5.0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cement requires a minimum of 5 bags for delivery.')),
            );
            return;
          }
          if (item['name'] == 'Hollow Blocks' && item['quantity'] < 50.0) { 
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Minimum Quantity Alert'),
                  content: const Text('Hollow blocks require a minimum total of 50 blocks for delivery. Your current quantity is not enough for delivery.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
            return;
          }
        }
      }

      bool hasOnlyOtherProducts = widget.selectedCartItems.every((item) => item['category'] != 'Construction Materials');
      if (hasOnlyOtherProducts) {
        double totalOtherQuantity = 0;
        for (var item in widget.selectedCartItems) {
          totalOtherQuantity += item['quantity'];
        }
        if (totalOtherQuantity < 50.0) { 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Other products require a minimum total quantity of 50 for delivery.')),
          );
          return;
        }
      }
    }

    final String orderId = '#${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    final String orderDate = MaterialLocalizations.of(context).formatShortDate(DateTime.now());

    final Map<String, dynamic> newOrder = {
      'orderId': orderId,
      'status': 'Order Placed',
      'eta': _deliveryOption == 'delivery' ? MaterialLocalizations.of(context).formatShortDate(_selectedDate!) : 'N/A',
      'progress': 0.0,
      'steps': ['Order Placed', 'Processing', 'Shipped', 'Out for Delivery', 'Delivered'],
      'items': widget.selectedCartItems.map((item) => '${item['quantity'].toStringAsFixed(item['category'] == 'Construction Materials' && (item['name'] == 'Sand' || item['name'] == 'Gravel') ? 1 : 0)}x ${item['name']} - ${item['type']}').toList(),
      'total': _subtotal,
      'deliveryOption': _deliveryOption,
      'date': orderDate, 
      'deliveryAddress': _currentSelectedAddress,
    };

    AccountPage.addOrder(newOrder);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed successfully!')),
    );
    for (var selectedItem in widget.selectedCartItems) {
      CartPage._cartItems.removeWhere((cartItem) => cartItem['id'] == selectedItem['id'] && cartItem['type'] == selectedItem['type'] && cartItem['brand'] == selectedItem['brand']);
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  double get _subtotal {
    double total = 0.0;
    for (var item in widget.selectedCartItems) {
      total += (item['price'] * (item['quantity'] ?? 0.0));
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.selectedCartItems.length,
              itemBuilder: (context, index) {
                final item = widget.selectedCartItems[index];
                String quantityText;
                if (item['category'] == 'Construction Materials' && (item['name'] == 'Sand' || item['name'] == 'Gravel')) {
                  quantityText = item['quantity'].toStringAsFixed(1);
                } else {
                  quantityText = item['quantity'].toStringAsFixed(0);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item['imageUrl'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey[300],
                            child: Center(
                              child: Icon(Icons.broken_image, color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item['name']} - ${item['type']}', 
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('$quantityText ${item['unit'] ?? ''} x ₱${item['price'].toStringAsFixed(2)}'), 
                          ],
                        ),
                      ),
                      Text('₱${(item['quantity'] * item['price']).toStringAsFixed(2)}'), 
                    ],
                  ),
                );
              },
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '₱${_subtotal.toStringAsFixed(2)}', 
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 32),

            Text(
              'Delivery Information',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Delivery Address:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Column(
                      children: _deliveryAddresses.map((address) {
                        return RadioListTile<String>(
                          title: Text(address),
                          value: address,
                          groupValue: _currentSelectedAddress,
                          onChanged: (String? value) {
                            setState(() {
                              _currentSelectedAddress = value!;
                            });
                          },
                          activeColor: Theme.of(context).primaryColor,
                        );
                      }).toList(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: _addNewAddress,
                        icon: const Icon(Icons.add_location_alt),
                        label: const Text('Add New Address'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Deliver'),
                            value: 'delivery',
                            groupValue: _deliveryOption,
                            onChanged: _canDeliver ? (value) {
                              setState(() {
                                _deliveryOption = value!;
                              });
                            } : null,
                            activeColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Pick-up'),
                            value: 'pickup',
                            groupValue: _deliveryOption,
                            onChanged: (value) {
                              setState(() {
                                _deliveryOption = value!;
                              });
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    if (!_canDeliver)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Delivery is only available for orders with Construction Materials or a total quantity of 50+ items.',
                          style: TextStyle(color: Colors.red[700], fontSize: 12),
                        ),
                      ),
                    if (_deliveryOption == 'delivery') ...[
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          _selectedDate == null
                              ? 'Select Delivery Date'
                              : 'Delivery Date: ${MaterialLocalizations.of(context).formatShortDate(_selectedDate!)}',
                        ),
                        trailing: const Icon(Icons.calendar_today),
                        onTap: () => _selectDate(context),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _placeOrder,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, String>> _notifications = const [
    {'title': 'Order Shipped!', 'body': 'Your order #12345 has been shipped and is on its way.', 'time': '2 hours ago'},
    {'title': 'New Product Alert', 'body': 'Check out our new range of power tools!', 'time': '1 day ago'},
    {'title': 'Delivery Update', 'body': 'Your order #12340 will arrive tomorrow.', 'time': '3 days ago'},
    {'title': 'Welcome Discount', 'body': 'Enjoy 10% off your first purchase!', 'time': '1 week ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  const Text(
                    'No new notifications.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                    title: Text(
                      notification['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(notification['body']!, style: const TextStyle(color: Colors.black87)),
                        const SizedBox(height: 4),
                        Text(
                          notification['time']!,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
          
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tapped on: ${notification['title']}')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'Hardware Personnel', 'text': 'Hello! How can I help you today?', 'isMe': false},
    {'sender': 'Me', 'text': 'Hi, I have a question about my recent order.', 'isMe': true},
    {'sender': 'Hardware Personnel', 'text': 'Sure, what is your order number?', 'isMe': false},
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'Me', 'text': _messageController.text, 'isMe': true});
        _messageController.clear();
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _messages.add({'sender': 'Hardware Personnel', 'text': 'Thank you for your message. We will get back to you shortly.', 'isMe': false});
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messaging'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isMe'] == true ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: message['isMe'] == true ? Theme.of(context).primaryColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: message['isMe'] == true ? Colors.black : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  mini: true,
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static final List<Map<String, dynamic>> _newOrders = [];

  static final List<Map<String, dynamic>> _orderHistory = [];

  static void addOrder(Map<String, dynamic> order) {
    _newOrders.add(order);
  }

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController(text: 'customer'); 
  final TextEditingController _emailController = TextEditingController(text: 'customer@gmail.com'); 
  final TextEditingController _phoneController = TextEditingController(text: '09951717304');
  final TextEditingController _addressController = TextEditingController(text: 'Alangilan');

  String _profileImageUrl = 'https://placehold.co/120x120/FDD835/000000?text=C'; 
  bool _isEditing = true;


  @override
  void initState() {
    super.initState();
    AccountPage._orderHistory.addAll(AccountPage._newOrders);
    AccountPage._newOrders.clear();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Personal information updated!')),
        );
      }
    });
  }

  void _changeProfilePicture() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Simulating profile picture change...')),
    );

    setState(() {
      _profileImageUrl = 'https://placehold.co/120x120/000000/FDD835?text=New+Pic';
    });
  }

  void _cancelOrder(String orderId) {
    final orderIndex = AccountPage._orderHistory.indexWhere((o) => o['orderId'] == orderId);
    if (orderIndex == -1) return; 

    final order = AccountPage._orderHistory[orderIndex];

    if (order['status'] == 'Processing' || order['status'] == 'Shipped' || order['status'] == 'Out for Delivery') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order is already processing, shipped, or out for delivery and cannot be cancelled.')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Order'),
          content: Text('Are you sure you want to cancel order $orderId? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  AccountPage._orderHistory[orderIndex]['status'] = 'Cancelled';
                  AccountPage._orderHistory[orderIndex]['progress'] = 0.0; 
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order $orderId cancelled.')),
                );
                Navigator.of(context).pop(); 
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Yes, Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logging out...')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> activeOrders = AccountPage._orderHistory.where((order) {
      final status = order['status'];
      return status != 'Delivered' && status != 'Cancelled';
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.edit : Icons.edit),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                        backgroundImage: NetworkImage(_profileImageUrl),
                        onBackgroundImageError: (exception, stackTrace) {
                     
                          setState(() {
                            _profileImageUrl = '';
                          });
                        },
                        child: _profileImageUrl.isEmpty
                            ? Icon(
                                Icons.person,
                                size: 80,
                                color: Theme.of(context).primaryColor,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 20,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, size: 20, color: Colors.white),
                            onPressed: _changeProfilePicture,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _nameController.text,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _emailController.text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Text(
              'Personal Information',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInfoField('Name', _nameController, Icons.person, _isEditing),
            _buildInfoField('Email', _emailController, Icons.email, _isEditing, keyboardType: TextInputType.emailAddress),
            _buildInfoField('Phone', _phoneController, Icons.phone, _isEditing, keyboardType: TextInputType.phone),
            _buildInfoField('Address', _addressController, Icons.location_on, _isEditing),
            const SizedBox(height: 32),

            Text(
              'Active Orders',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            activeOrders.isEmpty
                ? const Text('No active deliveries.')
                : Column(
                    children: activeOrders.map<Widget>((order) {
                      int currentStepIndex = order['steps'].indexOf(order['status']);
                      if (currentStepIndex == -1) currentStepIndex = 0; 

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order ${order['orderId']}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text('Status: ${order['status']} - ETA: ${order['eta']}'),
                              const SizedBox(height: 16),
                              Column( 
                                children: order['steps'].asMap().entries.map<Widget>((entry) {
                                  int idx = entry.key;
                                  String step = entry.value;
                                  bool isActive = idx <= currentStepIndex;
                                  IconData icon = Icons.radio_button_off;
                                  Color iconColor = Colors.grey;

                                  if (idx < currentStepIndex) {
                                    icon = Icons.check_circle;
                                    iconColor = Theme.of(context).primaryColor;
                                  } else if (idx == currentStepIndex) {
                                    icon = Icons.radio_button_checked;
                                    iconColor = Theme.of(context).primaryColor;
                                  }

                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(icon, color: iconColor, size: 20),
                                          const SizedBox(width: 8),
                                          Text(
                                            step,
                                            style: TextStyle(
                                              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                                              color: isActive ? Colors.black : Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (idx < order['steps'].length - 1)
                                        Container(
                                          margin: const EdgeInsets.only(left: 9, top: 4, bottom: 4),
                                          height: 20,
                                          width: 2,
                                          color: isActive ? Theme.of(context).primaryColor : Colors.grey,
                                        ),
                                    ],
                                  );
                                }).toList(),
                              ),
                              if (order['status'] != 'Delivered' && order['status'] != 'Cancelled' &&
                                  (order['status'] != 'Processing' && order['status'] != 'Shipped' && order['status'] != 'Out for Delivery'))
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => _cancelOrder(order['orderId']),
                                    child: const Text(
                                      'Cancel Order',
                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              if (order['status'] == 'Processing' || order['status'] == 'Shipped' || order['status'] == 'Out for Delivery')
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Cannot cancel (${order['status']})',
                                    style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 32),

            Text(
              'Order History',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AccountPage._orderHistory.isEmpty
                ? const Text('No past orders.')
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AccountPage._orderHistory.length,
                    itemBuilder: (context, index) {
                      final order = AccountPage._orderHistory[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: ExpansionTile(
                          leading: Icon(Icons.history, color: Theme.of(context).primaryColor),
                          title: Text(
                            'Order ${order['orderId']} - ${order['date']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: order['status'] == 'Cancelled' ? Colors.red : Colors.black, 
                            ),
                          ),
                          subtitle: Text(
                            'Status: ${order['status']} - Total: ₱${order['total'].toStringAsFixed(2)}',
                            style: TextStyle(
                              color: order['status'] == 'Cancelled' ? Colors.red : Colors.grey,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ...order['items'].map<Widget>((item) => Text('- $item')).toList(),
                                  const SizedBox(height: 8),
                                  Text('Delivery Option: ${order['deliveryOption'] == 'delivery' ? 'Delivery' : 'Pick-up'}'),
                                  if (order['deliveryOption'] == 'delivery' && order['eta'] != 'N/A')
                                    Text('ETA: ${order['eta']}'),
                                  Text('Delivery Address: ${order['deliveryAddress'] ?? 'N/A'}'), 
                                ],
                              ),
                            ),
          
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Viewing details for order ${order['orderId']}')),
                                    );
                                  },
                                  child: const Text('View Details'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
            const SizedBox(height: 32),

            Center(
              child: ElevatedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, 
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, TextEditingController controller, IconData icon, bool isEditable, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        readOnly: !isEditable,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: isEditable ? const OutlineInputBorder() : InputBorder.none,
          filled: !isEditable,
          fillColor: isEditable ? Colors.grey[200] : Colors.transparent,
        ),
        style: TextStyle(color: isEditable ? Colors.black : Colors.black87),
      ),
    );
  }
}
