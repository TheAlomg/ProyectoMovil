import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  // Función para mostrar los detalles del anuncio en la parte de "Aquí van los anuncios disponibles"
  void showAdDetailsDialog(BuildContext context, String name, String content, int participants, double value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles del Anuncio'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nombre: $name'),
                Text('Contenido del Anuncio: $content'),
                Text('Cantidad de Participantes: $participants'),
                Text('Valor: $value'),
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
            // Puedes agregar aquí widgets para mostrar los anuncios
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
                print(
                    'Seleccionaste la opción de crear anuncio'); // Impresión de depuración
                Navigator.pop(context); // Cierra el menú
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAdPage()),
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

                      // Cerrar la página de creación de anuncios
                      Navigator.pop(context);

                      // Mostrar los detalles del anuncio en la página principal
                      MyHomePage().showAdDetailsDialog(context, name, content, participants, value);
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
