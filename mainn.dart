import 'dart:io';
void main(){
  List<Map<String, dynamic>>productos = [];


  bool continuar = true;
  while(continuar){
    print(' ____________________');
    print('que deseas realizar:');
    print('                ');
    print('1. Agregar producto');
    print('                ');
    print('2. listar productos'); 
    print('                ');
    print('3. actualizar productos');
    print('                ');
    print('4. eliminar productos');
    print('                ');
    print('5. salir');
    print(' ____________________');

    String? opcion = stdin.readLineSync();
    switch(opcion){
      case '1':
        agregarProducto(productos);
        break;
      case '2':
        listarProductos(productos);
        break;
      case '3':
        actualizarProducto(productos);
        break;
      case '4':
        eliminarProducto(productos);
        break;
      case '5':
        continuar = false;
        break;
      default:
        print('opcion no valida');
    }
  }

  
}

void agregarProducto(List<Map<String, dynamic>> productos) {
  print('ingrese el nombre del producto:');
  String? nombre = stdin.readLineSync();

 if (nombre == null || nombre.isEmpty) {
    print('el nombre no puede estar vacío');
    return;
  }
  print('ingrese la cantidad disponible del producto:');
  int? cantidadDisponible = int.tryParse(stdin.readLineSync() ?? '');

if (cantidadDisponible == null || cantidadDisponible <= 0) {
    print('la cantidad debe ser un número positivo');
    return;
  }

  print('ingrese el precio del producto:');
  double? precio = double.tryParse(stdin.readLineSync() ?? '');

  
  if (precio == null || precio <= 0) {
    print('el precio debe ser un número positivo');
    return;


  }
  productos.add({
    'nombre': nombre,
    'cantidadDisponible': cantidadDisponible,
    'precio': precio
  });
  print('producto agregado correctamente');
}



void listarProductos(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print('no hay productos agregados');
    return;

  } 
  
  else {
    print('productos:');
    for (int i = 0; i < productos.length; i++) {
      print('$i. Nombre: ${productos[i]['nombre']},                Precio: ${productos[i]['precio']},                       Cantidad Disponible: ${productos[i]['cantidadDisponible']}');
    }
  }
}








void actualizarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print('no hay productos en la lista');
    return;
  }
  listarProductos(productos);

  print('seleccione el indice del producto que desea actualizar');
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice == null || indice < 0 || indice >= productos.length) {
    print('indice incorrecto');
    return;
  }

  

  print('ingrese el nuevo nombre del producto');
  String? nombre = stdin.readLineSync();
  if (nombre != null && nombre.trim().isNotEmpty) {
    productos[indice]['nombre'] = nombre.trim();
  }


  print('ingrese la nueva cantidad del producto');
  String? cantidadStr = stdin.readLineSync();
  if (cantidadStr != null && cantidadStr.trim().isNotEmpty) {
    int? cantidadDisponible = int.tryParse(cantidadStr.trim());
    if (cantidadDisponible != null && cantidadDisponible > 0) {
      productos[indice]['cantidadDisponible'] = cantidadDisponible;
    } else {
      print('Cantidad inválida.');
    }
  }


  print('ingrese el nuevo precio del producto');
  String? precioStr = stdin.readLineSync();
  if (precioStr != null && precioStr.trim().isNotEmpty) {
    double? precio = double.tryParse(precioStr.trim());
    if (precio != null && precio > 0) {
      productos[indice]['precio'] = precio;
    } else {
      print('Precio inválido');
    }
  }

  print('actualizado correctamente');
}



void eliminarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print('No hay productos para eliminar.');
    return;
  }
  listarProductos(productos);

  print('seleccione el indice del producto que desea eliminar');
  String? indiceStr = stdin.readLineSync();
  int? indice = int.tryParse(indiceStr ?? '');
  if (indice == null || indice < 0 || indice >= productos.length) {
    print('indice incorrecto');
    return;
  }

  productos.removeAt(indice);
  print('producto eliminado correctamente');
}
