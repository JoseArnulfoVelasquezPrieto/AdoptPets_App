class Refugio {
  final String nombre;
  final String direccion;
  final String telefono;
  final String? imagen;

  Refugio({
    required this.nombre,
    required this.direccion,
    required this.telefono,
    this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'imagen': imagen,
    };
  }

  factory Refugio.fromMap(Map<dynamic, dynamic> map) {
    return Refugio(
      nombre: map['nombre'],
      direccion: map['direccion'],
      telefono: map['telefono'],
      imagen: map['imagen'],
    );
  }
}