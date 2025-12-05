import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noticias = [
      {
        'titulo': 'Alimentación saludable para tu perro',
        'descripcion':
            'Aprende a darle una dieta balanceada y mantenerlo feliz y saludable. Incluye proteínas de calidad, carbohidratos moderados y verduras.',
        'tiempo': '5 min lectura',
      },
      {
        'titulo': 'Cómo cuidar a un gato senior',
        'descripcion':
            'Tips para cuidar la salud y bienestar de tu gato mayor. Controla su peso, revisa sus dientes y ofrece comidas fáciles de digerir.',
        'tiempo': '4 min lectura',
      },
      {
        'titulo': 'Juegos y ejercicio diario',
        'descripcion':
            'La actividad física es esencial para mantener a tu mascota en forma. Juega con tu perro o gato al menos 30 minutos al día.',
        'tiempo': '6 min lectura',
      },
      {
        'titulo': 'Vacunas y visitas al veterinario',
        'descripcion':
            'Mantén al día las vacunas y chequeos de tu mascota para prevenir enfermedades. Lleva un control de desparasitaciones.',
        'tiempo': '7 min lectura',
      },
    ];

    final imagenes = [
      'assets/images/noticia1.jpg',
      'assets/images/noticia2.jpg',
      'assets/images/noticia3.jpg',
      'assets/images/noticia4.jpg',
    ];

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
                child: Column(
                  children: [
                    // Sección de noticias/artículos
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: noticias.length,
                        itemBuilder: (context, index) {
                          final noticia = noticias[index];
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
                                // Imagen
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    imagenes[index],
                                    width: double.infinity,
                                    height: 180,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: double.infinity,
                                        height: 180,
                                        color: const Color(0xFFE8F5E9),
                                        child: const Icon(
                                          Icons.pets,
                                          size: 60,
                                          color: Color(0xFF4CAF50),
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                // Contenido
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Tiempo de lectura
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE8F5E9),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          noticia['tiempo']!,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF4CAF50),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      // Título
                                      Text(
                                        noticia['titulo']!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E7D32),
                                        ),
                                      ),
                                      const SizedBox(height: 8),

                                      // Descripción
                                      Text(
                                        noticia['descripcion']!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[700],
                                          height: 1.5,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 12),

                                      // Botón leer más
                                      TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              title: Text(
                                                noticia['titulo']!,
                                                style: const TextStyle(
                                                  color: Color(0xFF2E7D32),
                                                ),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Text(
                                                  noticia['descripcion']!,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    height: 1.6,
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xFF4CAF50),
                                                    foregroundColor:
                                                        Colors.white,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 24,
                                                      vertical: 12,
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: const Text('Cerrar'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              const Color(0xFF4CAF50),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text(
                                              'Leer más',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Icon(Icons.arrow_forward, size: 18),
                                          ],
                                        ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}