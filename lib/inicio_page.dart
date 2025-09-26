import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noticias = [
      {
        'titulo': 'Alimentación saludable para tu perro',
        'descripcion': 'Aprende a darle una dieta balanceada y mantenerlo feliz y saludable. '
            'Incluye proteínas de calidad, carbohidratos moderados y verduras. '
            'Evita darle alimentos tóxicos como chocolate o uvas.\n\n'
            'También es importante establecer horarios de comida y no sobrealimentarlo para prevenir obesidad.'
      },
      {
        'titulo': 'Cómo cuidar a un gato senior',
        'descripcion': 'Tips para cuidar la salud y bienestar de tu gato mayor. '
            'Controla su peso, revisa sus dientes y ofrece comidas fáciles de digerir.\n\n'
            'Proporciona un ambiente tranquilo y seguro, con lugares cómodos para dormir y descansar.'
      },
      {
        'titulo': 'Juegos y ejercicio diario',
        'descripcion': 'La actividad física es esencial para mantener a tu mascota en forma. '
            'Juega con tu perro o gato al menos 30 minutos al día.\n\n'
            'Usa juguetes, recorridos y ejercicios mentales que estimulen su inteligencia y coordinación.'
      },
      {
        'titulo': 'Vacunas y visitas al veterinario',
        'descripcion': 'Mantén al día las vacunas y chequeos de tu mascota para prevenir enfermedades. '
            'Lleva un control de desparasitaciones y revisiones periódicas.\n\n'
            'Consulta con tu veterinario sobre vacunas adicionales según su edad, raza y estilo de vida.'
      },
    ];

    final imagenes = [
      'assets/images/noticia1.jpg',
      'assets/images/noticia2.jpg',
      'assets/images/noticia3.jpg',
      'assets/images/noticia4.jpg',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        final noticia = noticias[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagenes[index],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      noticia['titulo']!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(noticia['descripcion']!),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}