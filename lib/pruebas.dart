/*
ElevatedButton(
  onPressed: _isButtonEnabled
      ? () {
          // Acción al presionar el botón de publicar
          String name = _nameController.text;
          String content = _contentController.text;
          int participants = int.parse(_participantsController.text);
          double value = double.parse(_valueController.text);

          // Mostrar la información en un cuadro de diálogo
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
                      Navigator.of(context).pop();
                    },
                    child: Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        }
      : null,
  child: Text('Publicar'),
),

*/



/*

              onPressed: _isButtonEnabled
                  ? () {
                      // Acción al presionar el botón de publicar
                      String name = _nameController.text;
                      String content = _contentController.text;
                      int participants =
                          int.parse(_participantsController.text);
                      double value = double.parse(_valueController.text);

                      // Aquí puedes hacer algo con la información del anuncio
                    }
                  : null,
              child: Text('Publicar'),

              */
              /*
            
ElevatedButton(
  onPressed: _isButtonEnabled
      ? () {
          // Acción al presionar el botón de publicar
          String name = _nameController.text;
          String content = _contentController.text;
          int participants = int.parse(_participantsController.text);
          double value = double.parse(_valueController.text);

          // Mostrar la información en el centro de la pantalla
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Detalles del Anuncio',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Nombre: $name'),
                    Text('Contenido del Anuncio: $content'),
                    Text('Cantidad de Participantes: $participants'),
                    Text('Valor: $value'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Regresar a la pantalla anterior
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      : null,
  child: Text('Publicar'),
),
*/


/*

          // Acción al presionar el botón de publicar
          String name = _nameController.text;
          String content = _contentController.text;
          int participants = int.parse(_participantsController.text);
          double value = double.parse(_valueController.text);

          // Mostrar la información en el centro de la pantalla
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Detalles del Anuncio',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Nombre: $name'),
                    Text('Contenido del Anuncio: $content'),
                    Text('Cantidad de Participantes: $participants'),
                    Text('Valor: $value'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Regresar a la pantalla anterior
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                ),
              ),
            ),
          );
        
*/

/*
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

class MyHomePage extends StatelessWidget {
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

*/