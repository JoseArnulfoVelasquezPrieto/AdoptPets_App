import 'package:flutter/material.dart';

class AdopcionPage extends StatelessWidget {
  const AdopcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdoptPets - Adopción'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            FiltrosSection(),
            MascotasGrid(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

/* 1. Foto grande */
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/perrito4.jpg', fit: BoxFit.cover),
          Container(color: Colors.black45),
          const Center(
            child: Text(
              'Mascotas',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

/* 2. Filtros */
class FiltrosSection extends StatefulWidget {
  const FiltrosSection({super.key});

  @override
  State<FiltrosSection> createState() => _FiltrosSectionState();
}

class _FiltrosSectionState extends State<FiltrosSection> {
  String? tipo, edad, tamano, genero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filtrar mascotas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _drop('Tipo', tipo, ['Perro', 'Gato'], (v) => tipo = v),
            _drop('Edad', edad, ['Cachorro', 'Joven', 'Adulto'], (v) => edad = v),
            _drop('Tamaño', tamano, ['Pequeño', 'Mediano', 'Grande'],
                (v) => tamano = v),
            _drop('Género', genero, ['Macho', 'Hembra'], (v) => genero = v),
          ]),
        ],
      ),
    );
  }

  Widget _drop(String label, String? val, List<String> opts, Function(String?) onC) {
    return SizedBox(
      width: 150,
      child: DropdownButtonFormField<String>(
        value: val,
        hint: Text(label),
        items: opts.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
        onChanged: (v) => setState(() => onC(v)),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

/* 3. Tarjetas */
class MascotasGrid extends StatelessWidget {
  const MascotasGrid({super.key});

  final List<Map<String, dynamic>> lista = const [
    {'nom': 'Thomas', 'img': 'gato1.jpg', 'gen': 'Macho', 'est': 'Disponible'},
    {'nom': 'Luna', 'img': 'gato2.jpg', 'gen': 'Hembra', 'est': 'Disponible'},
    {'nom': 'Max', 'img': 'perrito2.jpg', 'gen': 'Macho', 'est': 'Adoptado'},
    {'nom': 'Bella', 'img': 'perrito3.png', 'gen': 'Hembra', 'est': 'Disponible'},
    {'nom': 'Rocky', 'img': 'perrito4.jpg', 'gen': 'Macho', 'est': 'Disponible'},
    {'nom': 'Mimi', 'img': 'gato3.jpg', 'gen': 'Hembra', 'est': 'Disponible'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mascotas disponibles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: lista.length,
            itemBuilder: (context, i) {
              final m = lista[i];
              final disponible = m['est'] == 'Disponible';
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset('assets/images/${m['img']}', fit: BoxFit.cover),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: disponible ? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(m['est'],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m['nom'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Género: ${m['gen']}'),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: disponible
                                  ? () {
                                      // Aquí irá el formulario más adelante
                                    }
                                  : null,
                              child: Text(disponible ? 'Adoptar' : 'Adoptado'),
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
        ],
      ),
    );
  }
}

/* 4. Footer */
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: const Center(
          child: Text('© 2025 AdoptPets - Todos los derechos reservados')),
    );
  }
}