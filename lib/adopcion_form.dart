import 'package:flutter/material.dart';
import 'models/mascota.dart';
import 'database_helper.dart';

class AdopcionFormPage extends StatefulWidget {
  final Mascota mascota;

  const AdopcionFormPage({super.key, required this.mascota});

  @override
  State<AdopcionFormPage> createState() => _AdopcionFormPageState();
}

class _AdopcionFormPageState extends State<AdopcionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _direccionCtrl = TextEditingController();
  final _ingresosCtrl = TextEditingController();
  final _tiempoCtrl = TextEditingController();
  final _motivoCtrl = TextEditingController();

  void _enviarSolicitud() async {
    if (_formKey.currentState!.validate()) {
      // Crear mapa de la solicitud
      final solicitud = {
        'mascota': widget.mascota.nombre,
        'nombre': _nombreCtrl.text.trim(),
        'telefono': _telefonoCtrl.text.trim(),
        'direccion': _direccionCtrl.text.trim(),
        'ingresos': _ingresosCtrl.text.trim(),
        'tiempo': _tiempoCtrl.text.trim(),
        'motivo': _motivoCtrl.text.trim(),
      };

      // Guardar en Hive y actualizar estado de la mascota
      await DatabaseHelper.saveSolicitud(solicitud);

      // Mostrar alerta y redirigir a HomePage
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Solicitud enviada'),
          content: const Text('Tu solicitud de adopción ha sido enviada.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false); // Va a HomePage
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Adopción'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 🐾 Lado izquierdo: Imagen y datos de la mascota
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.mascota.imagen != null
                      ? Image.asset(
                          widget.mascota.imagen!,
                          fit: BoxFit.cover,
                          height: 300,
                          width: double.infinity,
                        )
                      : const Icon(Icons.pets, size: 150, color: Colors.green),
                  const SizedBox(height: 16),
                  Text(
                    widget.mascota.nombre,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("${widget.mascota.especie} - ${widget.mascota.raza}"),
                  Text("Color: ${widget.mascota.color}"),
                  Text("Estado: ${widget.mascota.estado}"),
                ],
              ),
            ),

            const SizedBox(width: 32),

            // 📝 Lado derecho: Formulario
            Expanded(
              flex: 1,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nombreCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Campo obligatorio' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _telefonoCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Teléfono',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Campo obligatorio' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _direccionCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Dirección',
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) =>
                            val!.isEmpty ? 'Campo obligatorio' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _ingresosCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Ingresos mensuales \$',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _tiempoCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Tiempo disponible para el animal',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _motivoCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Motivo de adopción',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5,
                        validator: (val) =>
                            val!.isEmpty ? 'Campo obligatorio' : null,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: _enviarSolicitud,
                          child: const Text('Enviar solicitud'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}