import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'models/refugio.dart';

class RefugiosPage extends StatelessWidget {
  const RefugiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Refugio> refugios = DatabaseHelper.getRefugios();

    return ListView.builder(
      itemCount: refugios.length,
      itemBuilder: (context, index) {
        final refugio = refugios[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: refugio.imagen != null
                ? Image.asset(
                    refugio.imagen!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.home, color: Colors.blue),
            title: Text(refugio.nombre),
            subtitle: Text(refugio.direccion),
            trailing: Text(refugio.telefono),
          ),
        );
      },
    );
  }
}