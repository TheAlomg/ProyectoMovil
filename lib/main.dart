import 'package:flutter/material.dart';
import 'anuncio.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Anuncio();
  }
}

class AuthService {
  static Future<void> login(String email, String password) async {
    // Implementar la lógica de autenticación (por ejemplo, con Firebase)
    // Simulación de login exitoso
    await Future.delayed(Duration(seconds: 2));
  }

  static Future<void> register(String email, String password) async {
    // Implementar la lógica de registro (por ejemplo, con Firebase)
    // Simulación de registro exitoso
    await Future.delayed(Duration(seconds: 2));
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoginForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoginForm ? 'Iniciar sesión' : 'Registrar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: _isLoginForm ? _buildLoginForm() : _buildRegisterForm(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su correo electrónico.';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su contraseña.';
              }
              return null;
            },
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                _login();
              }
            },
            child: Text('Iniciar sesión'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              setState(() {
                _isLoginForm = false;
              });
            },
            child: Text('¿No tienes una cuenta? Regístrate aquí.'),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su correo electrónico.';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su contraseña.';
              }
              return null;
            },
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              if (_registerFormKey.currentState!.validate()) {
                _register();
              }
            },
            child: Text('Registrar'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              setState(() {
                _isLoginForm = true;
              });
            },
            child: Text('¿Ya tienes una cuenta? Inicia sesión aquí.'),
          ),
        ],
      ),
    );
  }

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await AuthService.login(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print('Error al iniciar sesión: $e');
      // Mostrar mensaje de error al usuario
    }
  }

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await AuthService.register(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      print('Error al registrar: $e');
      // Mostrar mensaje de error al usuario
    }
  }
}
