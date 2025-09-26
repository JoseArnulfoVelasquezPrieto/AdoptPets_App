class Mascota {
  final String nombre;
  final String especie;
  final String raza;
  final String color;
  final String? imagen;
  final String estado;

  Mascota({
    required this.nombre,
    required this.especie,
    required this.raza,
    required this.color,
    this.imagen,
    required this.estado,
  });

  factory Mascota.fromMap(Map<String, dynamic> map) {
    return Mascota(
      nombre: map['nombre'] ?? '',
      especie: map['especie'] ?? '',
      raza: map['raza'] ?? '',
      color: map['color'] ?? '',
      imagen: map['imagen'],
      estado: map['estado'] ?? 'Disponible',
    );
  }
}