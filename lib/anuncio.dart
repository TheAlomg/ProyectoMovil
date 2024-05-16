import 'package:flutter/material.dart';
import 'crearA.dart';

void main() {
  runApp(Anuncio());
}

class Anuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _adName = '';
  String _adContent = '';
  int _adParticipants = 0;
  double _adValue = 0.0;

  // Función para actualizar los detalles del anuncio
  void updateAdDetails(String name, String content, int participants, double value) {
    setState(() {
      _adName = name;
      _adContent = content;
      _adParticipants = participants;
      _adValue = value;
    });
  }

  // Función para mostrar los detalles del anuncio en la parte de "Aquí van los anuncios disponibles"
  void showAdDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles del Anuncio'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nombre: $_adName'),
                Text('Contenido del Anuncio: $_adContent'),
                Text('Cantidad de Participantes: $_adParticipants'),
                Text('Valor: $_adValue'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ServiExpress'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Acción al presionar el botón de perfil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aquí van los anuncios disponibles',
              style: TextStyle(fontSize: 20.0),
            ),
            // Mostrar los detalles del anuncio
            ElevatedButton(
              onPressed: () {
                showAdDetailsDialog(context);
              },
              child: Text('Mostrar Detalles del Anuncio'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Comprar Membresia'),
              onTap: () {
                // Acción al seleccionar la opción 1
                Navigator.pop(context); // Cierra el menú
              },
            ),
            GestureDetector(
              onTap: () {
                print('Seleccionaste la opción de crear anuncio'); // Impresión de depuración
                Navigator.pop(context); // Cierra el menú
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAdPage(updateAdDetails)),
                );
              },
              child: ListTile(
                title: Text('Crear Anuncio'),
              ),
            ),
            ListTile(
              title: Text('Configuraciones'),
              onTap: () {
                // Acción al seleccionar la opción 3
                Navigator.pop(context); // Cierra el menú
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAdPage extends StatefulWidget {
  final Function(String, String, int, double) updateAdDetails;

  CreateAdPage(this.updateAdDetails);

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _participantsController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  bool _isButtonEnabled = false;

  void _checkButtonState() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _contentController.text.isNotEmpty &&
          _participantsController.text.isNotEmpty &&
          _valueController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Anuncio'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
              onChanged: (value) {
                _checkButtonState();
              },
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Contenido del Anuncio'),
              onChanged: (value) {
                _checkButtonState();
              },
            ),
            TextField(
              controller: _participantsController,
              decoration:
                  InputDecoration(labelText: 'Cantidad de Participantes'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _checkButtonState();
              },
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _checkButtonState();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      // Acción al presionar el botón de publicar
                      String name = _nameController.text;
                      String content = _contentController.text;
                      int participants = int.parse(_participantsController.text);
                      double value = double.parse(_valueController.text);

                      // Actualizar los detalles del anuncio en la página principal
                      widget.updateAdDetails(name, content, participants, value);

                      // Regresar a la página principal
                      Navigator.pop(context);
                    }
                  : null,
              child: Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contenido de la página de perfil',
              style: TextStyle(fontSize: 20.0),
            ),
            // Aquí puedes agregar widgets para mostrar la información del perfil
          ],
        ),
      ),
    );
  }
}
