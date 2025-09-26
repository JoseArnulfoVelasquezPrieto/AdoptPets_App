import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'models/mascota.dart';
import 'adopcion_form.dart'; // ✅ Importar el formulario

class AdopcionPage extends StatelessWidget {
  const AdopcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Mascota> mascotas = DatabaseHelper.getMascotas();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // dos columnas
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75, // 🐾 ajustar altura
      ),
      itemCount: mascotas.length,
      itemBuilder: (context, index) {
        final mascota = mascotas[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(
                child: mascota.imagen != null
                    ? Image.asset(
                        mascota.imagen!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.pets, size: 80, color: Colors.green),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      mascota.nombre,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text('${mascota.especie} - ${mascota.raza}'),
                    Text('Estado: ${mascota.estado}'),
                    const SizedBox(height: 8),
                    // 🔹 Botón Adoptar actualizado
                    ElevatedButton(
                      onPressed: mascota.estado == 'Disponible'
                          ? () {
                              // Navegar al formulario real
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AdopcionFormPage(mascota: mascota),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 36),
                      ),
                      child: const Text('Adoptar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
