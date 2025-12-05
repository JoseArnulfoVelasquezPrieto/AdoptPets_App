import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'models/refugio.dart';

class RefugiosPage extends StatelessWidget {
  const RefugiosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Refugio> refugios = DatabaseHelper.getRefugios();

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Contenedor verde menta con bordes redondeados
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(211, 243, 220, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: refugios.length,
                  itemBuilder: (context, index) {
                    final refugio = refugios[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Imagen del refugio
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: refugio.imagen != null
                                ? Image.asset(
                                    refugio.imagen!,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    width: double.infinity,
                                    height: 200,
                                    color: const Color(0xFFE8F5E9),
                                    child: const Icon(
                                      Icons.home,
                                      color: Color(0xFF4CAF50),
                                      size: 80,
                                    ),
                                  ),
                          ),

                          // Información del refugio
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Nombre
                                Text(
                                  refugio.nombre,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2E7D32),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Dirección
                                _buildInfoRow(
                                  icon: Icons.location_on_outlined,
                                  text: refugio.direccion,
                                  color: const Color(0xFF4CAF50),
                                ),
                                const SizedBox(height: 12),

                                // Teléfono
                                _buildInfoRow(
                                  icon: Icons.phone_outlined,
                                  text: refugio.telefono,
                                  color: const Color(0xFF4CAF50),
                                ),
                                const SizedBox(height: 16),

                                // Botones de acción
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Llamando a ${refugio.telefono}'),
                                              backgroundColor:
                                                  const Color(0xFF4CAF50),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.phone, size: 20),
                                        label: const Text('Llamar'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF4CAF50),
                                          foregroundColor: Colors.white,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Abriendo ubicación...'),
                                              backgroundColor:
                                                  Color(0xFF4CAF50),
                                            ),
                                          );
                                        },
                                        icon: const Icon(Icons.map_outlined,
                                            size: 20),
                                        label: const Text('Ubicación'),
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFF4CAF50),
                                          side: const BorderSide(
                                            color: Color(0xFF4CAF50),
                                            width: 2,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF424242),
            ),
          ),
        ),
      ],
    );
  }
}