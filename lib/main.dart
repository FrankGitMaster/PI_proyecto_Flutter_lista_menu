import 'package:flutter/material.dart';

void main() {
  // Lista de platos y sus imágenes correspondientes
  List<Map<String, String>> menu = [
    {
      'nombrePlato': 'Pizza',
      'imagenPlato':
          'https://hoytoca-cms.ext-sites-prd.cloudherdez.com/assets/b0d29d09-852e-42e1-9e66-b486a01e25a3'
    },
    {
      'nombrePlato': 'Hamburguesa',
      'imagenPlato':
          'https://media.istockphoto.com/id/1331109186/es/foto/primer-plano-de-una-hamburguesa-vegetariana-con-espacio-de-copia.jpg?s=612x612&w=0&k=20&c=eUfjhtA4AVeZsudazN9CO55JIQ5NsgKW02gy3Sfxmco='
    },
    {
      'nombrePlato': 'Tacos',
      'imagenPlato':
          'https://img.lovepik.com/photo/20230421/medium/lovepik-mexican-tacos-with-meat-and-salsa-on-a-board-photo-image_352193142.jpg'
    },
    {
      'nombrePlato': 'Lasagna',
      'imagenPlato':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuudg-z8UP0Onlhf2Rpjj3jZmFkgO9IFWfA&s'
    },
        {
      'nombrePlato': 'Spaghetti',
      'imagenPlato':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4xq3L3F46Ih89xig_OnjZMxdJC243PfNBxlQtg-EjU82FbNe27ODnO34GkN3MMKZF9x0'
    },
        {
      'nombrePlato': 'Torta',
      'imagenPlato':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThKGcQy0qTg_vF-ud4A134nIFuU9hTWgBbOA&s'
    },
  ];

  runApp(MyApp(menu: menu)); // Pasamos la lista como parámetro
}

class MyApp extends StatefulWidget {
  // Lista de platos y sus imágenes
  final List<Map<String, String>> menu;

  const MyApp({Key? key, required this.menu}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista de contadores para cada elemento de la lista
  late List<int> counters;

  @override
  void initState() {
    super.initState();
    // Inicializar los contadores con valor 0
    counters = List<int>.filled(widget.menu.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menú',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 131, 15, 7),
        ),
        body: ListView.separated(
          itemCount:
              widget.menu.length, // Usamos widget.menu para acceder a la lista
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                widget.menu[index]['imagenPlato']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(widget.menu[index]['nombrePlato']!),
              subtitle: Text('Cantidad: ${counters[index]}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    onPressed: () {
                      setState(() {
                        if (counters[index] > 0)
                          counters[
                              index]--; // Disminuir el contador si es mayor a 0
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                    onPressed: () {
                      setState(() {
                        counters[
                            index]++; // Incrementar el contador correspondiente
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              '¡Pediste ${widget.menu[index]['nombrePlato']}!'),
                          content: const Text('¡Excelente elección!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
