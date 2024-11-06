import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231921),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_supportState)
            const Text("Device is supported")
          else
            const Text("Device is not supported"),
          const Divider(),
          ElevatedButton(
            onPressed: _getAvaiableBiometrics,
            child: Text("Get available biometrics"),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: _authenticate,
            child: Text("Authenticate"),
          )
        ],
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
          localizedReason: "Authenticate or you will die",
          options: const AuthenticationOptions(
            stickyAuth: false,
            biometricOnly: false,
          ));
      if (authenticated) {
        Navigator.pushNamed(context, "/notification");
      }
    } on PlatformException catch (e) {}
  }

  Future<void> _getAvaiableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print("Available biometrics: $availableBiometrics");

    if (!mounted) {
      return;
    }
  }
}
