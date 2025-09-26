import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/mascota.dart';
import 'models/refugio.dart';

class DatabaseHelper {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox('mascotas');
    await Hive.openBox('refugios');
    await Hive.openBox('solicitudes'); // ✅ Caja para solicitudes
  }

  static Future<void> insertInitialData() async {
    var mascotasBox = Hive.box('mascotas');
    var refugiosBox = Hive.box('refugios');

    if (mascotasBox.isEmpty) {
      // Mascotas
      mascotasBox.add({
        'nombre': 'Thomas',
        'especie': 'Gato',
        'raza': 'Criollo',
        'color': 'Blanco',
        'imagen': 'assets/images/gato1.jpg',
        'estado': 'Disponible',
      });
      mascotasBox.add({
        'nombre': 'Luna',
        'especie': 'Gato',
        'raza': 'Criolla',
        'color': 'Negro',
        'imagen': 'assets/images/gato2.jpg',
        'estado': 'Disponible',
      });
      mascotasBox.add({
        'nombre': 'Max',
        'especie': 'Perro',
        'raza': 'Criollo',
        'color': 'Marrón',
        'imagen': 'assets/images/perro2.jpg',
        'estado': 'Disponible', // ✅ Cambiado para pruebas
      });
      mascotasBox.add({
        'nombre': 'Bella',
        'especie': 'Perro',
        'raza': 'Criolla',
        'color': 'Blanco',
        'imagen': 'assets/images/perro3.jpg', // ✅ Asegúrate de que exista
        'estado': 'Disponible',
      });
      mascotasBox.add({
        'nombre': 'Rocky',
        'especie': 'Perro',
        'raza': 'Criollo',
        'color': 'Negro',
        'imagen': 'assets/images/perro1.jpg',
        'estado': 'Disponible',
      });
      mascotasBox.add({
        'nombre': 'Mimi',
        'especie': 'Gato',
        'raza': 'Criolla',
        'color': 'Gris',
        'imagen': 'assets/images/gato3.jpg',
        'estado': 'Disponible',
      });
    }

    if (refugiosBox.isEmpty) {
      // Refugios
      refugiosBox.add({
        'nombre': 'Fundación Protectora Bogotá',
        'direccion': 'Calle 26 #68-35',
        'telefono': '601-234-5678',
        'imagen': 'assets/images/refugio1.jpg',
      });
      refugiosBox.add({
        'nombre': 'Refugio Patitas Felices',
        'direccion': 'Calle 170 #45-23',
        'telefono': '601-456-7890',
        'imagen': 'assets/images/refugio2.jpg',
      });
    }
  }

  static List<Mascota> getMascotas() {
    var box = Hive.box('mascotas');
    return box.values
        .map((e) => Mascota.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  static List<Refugio> getRefugios() {
    var box = Hive.box('refugios');
    return box.values
        .map((e) => Refugio.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  // ✅ Guardar solicitud de adopción
  static Future<void> saveSolicitud(Map<String, dynamic> solicitud) async {
    var box = Hive.box('solicitudes');
    await box.add(solicitud);

    // Actualizar estado de la mascota a "Adoptado"
    var mascotasBox = Hive.box('mascotas');
    for (int i = 0; i < mascotasBox.length; i++) {
      var m = Map<String, dynamic>.from(mascotasBox.getAt(i));
      if (m['nombre'] == solicitud['mascota']) {
        m['estado'] = 'Adoptado';
        mascotasBox.putAt(i, m);
        break;
      }
    }
  }
}
