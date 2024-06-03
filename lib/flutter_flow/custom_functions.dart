import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<NextDaysStruct> getNextDays(DateTime currentTime) {
  List<NextDaysStruct> nextDaysList = [];
  // Arrays para mapear números a nombres en español
  final diasDeLaSemana = ['Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab', 'Dom'];
  final mesesDelAno = [
    'Ene',
    'Feb',
    'Mar',
    'Abr',
    'May',
    'Jun',
    'Jul',
    'Ago',
    'Sep',
    'Oct',
    'Nov',
    'Dic'
  ];

  for (int i = 0; i < 14; i++) {
    DateTime nextDay = currentTime.add(Duration(days: i));

    // Obtenemos el nombre del día y del mes usando los arrays
    String diaAbreviado =
        diasDeLaSemana[nextDay.weekday - 1]; // -1 porque weekday empieza en 1
    int diaNumero = nextDay.day; // Día del mes como número
    String mesAbreviado =
        mesesDelAno[nextDay.month - 1]; // -1 porque month empieza en 1

    // Formateamos la fecha completa en el formato deseado
    String fechaCompleta = DateFormat('yyyy-MM-dd').format(nextDay);

    nextDaysList.add(NextDaysStruct(
      diaAbreviado: diaAbreviado,
      diaNumero: diaNumero,
      mesAbreviado: mesAbreviado,
      fechaCompleta: fechaCompleta, // Añadimos la nueva propiedad aquí
    ));
  }

  return nextDaysList;
}

String newDate(String fecha) {
  DateFormat format = DateFormat('yyyy-MM-dd');
  DateTime inputDate = format.parseStrict(fecha);

  // Obtener la fecha actual sin tiempo
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Calcular la diferencia en días
  int difference = inputDate.difference(today).inDays;

  if (difference < 0) {
    switch (difference) {
      case -1:
        return 'Ayer';
      case -2:
        return 'Antes de ayer';
      default:
        return 'Hace ${-difference} días';
    }
  } else {
    switch (difference) {
      case 0:
        return 'Hoy';
      case 1:
        return 'Mañana';
      case 2:
        return 'Pasado mañana';
      default:
        return 'En $difference días';
    }
  }
}

String cuposDisponibles(
  String? aa,
  String? bb,
  String? cc,
  String? dd,
) {
  // Lista de todos los parámetros.
  List<String?> parametros = [aa, bb, cc, dd];

  // Contar cuántos de los parámetros son null.
  int cupos = parametros.where((parametro) => parametro == null).length;

  // Generar y devolver el mensaje basado en el número de cupos disponibles.
  switch (cupos) {
    case 1:
      return '¡1 cupo disponible!';
    case 2:
      return '¡2 cupos disponibles!';
    case 3:
      return '¡3 cupos disponibles!';
    case 4:
      return '¡4 cupos disponibles!';
    default:
      return '¡No hay cupos disponibles!';
  }
}

String rankingConvert(int rankingA) {
  int primerDigito = rankingA ~/ 100;
  int segundoTercerDigito = rankingA % 100;

  int resultado = 7 - primerDigito;
  String rankingConvertido = '$resultado.$segundoTercerDigito';

  return rankingConvertido;
}

String plusHour(String horaInicio) {
  // Primero, parseamos la hora de inicio para convertirla en un objeto DateTime
  List<String> parts = horaInicio.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  // Creamos un objeto DateTime para hoy con la hora y minutos dados
  DateTime startTime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, hour, minute);

  // Sumamos 1 hora y 30 minutos
  DateTime endTime = startTime.add(Duration(hours: 1, minutes: 30));

  // Formateamos la hora final para retornarla como una cadena en formato HH:mm
  String formattedEndTime =
      "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}";

  return formattedEndTime;
}

DateTime? convertDate(String fechaString) {
  /// Convierte una fecha de String a Date

  try {
    List<String> dateParts = fechaString.split('-');
    if (dateParts.length == 3) {
      int year = int.parse(dateParts[0]);
      int month = int.parse(dateParts[1]);
      int day = int.parse(dateParts[2]);

      return DateTime(year, month, day);
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

bool isIn(
  String? a,
  String? b,
  String? c,
  String? d,
  String uid,
) {
  List<String?> ids = [a, b, c, d];

  // Comprobar si alguno de los IDs coincide con el userId.
  for (String? id in ids) {
    if (id != null && id == uid) {
      return true; // Retorna verdadero si encuentra una coincidencia.
    }
  }

  return false; // Retorna falso si no encuentra ninguna coincidencia.
}

String oldDate(String fecha) {
  DateFormat format = DateFormat('yyyy-MM-dd');
  DateTime inputDate = format.parseStrict(fecha);

  // Obtener la fecha actual sin tiempo
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Calcular la diferencia en días
  int difference = today.difference(inputDate).inDays;

  switch (difference) {
    case 0:
      return 'Hoy';
    case 1:
      return 'Ayer';
    case 2:
      return 'Antes de ayer';
    default:
      return 'Hace $difference días';
  }
}

bool isNow(
  String horaInicio,
  String fecha,
  DateTime currentTime,
) {
  try {
    // Combinar la fecha y la hora de inicio en un solo string
    String fechaHoraInicio = '$fecha $horaInicio';

    // Parsear la fecha y hora de inicio en un objeto DateTime
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm');
    DateTime fechaHoraInicioDateTime = format.parseStrict(fechaHoraInicio);

    // Comparar la fecha y hora de inicio con la fecha y hora actual
    return currentTime.isAfter(fechaHoraInicioDateTime);
  } catch (e) {
    // En caso de error al parsear la fecha y hora, se considera que no es "ahora"
    return false;
  }
}

bool score(int num) {
  // Verifica si el resultado es entre 0 y 4

  return num >= 0 && num <= 4;
}

bool is2sets(
  int aa,
  int bb,
  int cc,
  int dd,
) {
  // Contamos cuántos sets ha ganado cada jugador.
  int player1Wins = 0;
  int player2Wins = 0;

  // Verificamos el resultado del primer set.
  if (aa > bb) {
    player1Wins++;
  } else {
    player2Wins++;
  }

  // Verificamos el resultado del segundo set.
  if (cc > dd) {
    player1Wins++;
  } else {
    player2Wins++;
  }

  // Si uno de los jugadores ha ganado 2 sets, el partido es a 2 sets.
  if (player1Wins == 2 || player2Wins == 2) {
    return true;
  }

  // Si ninguno ha ganado 2 sets, significa que habrá un tercer set.
  return false;
}

String returnResultado(
  String resultado,
  int posicion,
) {
  /// Convertimos el string a una lista de resultados
  List<String> resultados = resultado
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll('"', '')
      .split(', ');

  /// Verifica si la posición está dentro del rango de la lista
  if (posicion < 1 || posicion > resultados.length) {
    throw RangeError('La posición está fuera del rango de la lista');
  }

  /// Retorna el resultado en la posición especificada
  return resultados[posicion - 1];
}

int numSets(String resultado) {
  /// Convertimos el string a una lista de resultados
  List<String> resultados = resultado
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll('"', '')
      .split(', ');

  /// Retornamos el número de sets
  return resultados.length;
}

bool isMatchComplete(
  String? a,
  String? b,
  String? c,
  String? d,
) {
  /// Verifica si alguno de los parámetros es null
  if (a == null || b == null || c == null || d == null) {
    return false;
  }

  /// Si ninguno es null, retorna true
  return true;
}

bool is1win(
  int a,
  int b,
  int? c,
  int? d,
  int? e,
  int? f,
) {
  /// Inicializamos los contadores de sets ganados
  int pareja1Wins = 0;
  int pareja2Wins = 0;

  /// Verificamos el resultado del primer set
  if (a > b) {
    pareja1Wins++;
  } else {
    pareja2Wins++;
  }

  /// Verificamos el resultado del segundo set
  if (c != null && d != null) {
    if (c > d) {
      pareja1Wins++;
    } else {
      pareja2Wins++;
    }
  }

  /// Verificamos el resultado del tercer set, si existe
  if (e != null && f != null) {
    if (e > f) {
      pareja1Wins++;
    } else {
      pareja2Wins++;
    }
  }

  /// La pareja 1 gana si ha ganado al menos 2 sets
  return pareja1Wins >= 2;
}

List<String> listScore(
  String a,
  String b,
  String? c,
  String? d,
  String? e,
  String? f,
) {
  List<String> resultados = [];

  /// Agregamos el primer resultado
  resultados.add('$a/$b');

  /// Verificamos si c y d no son null y agregamos el resultado
  if (c != null && d != null) {
    resultados.add('$c/$d');
  }

  /// Verificamos si e y f no son null y ambos no son 0, luego agregamos el resultado
  if (e != null && f != null && (e != '0' || f != '0')) {
    resultados.add('$e/$f');
  }

  return resultados;
}

int is2win(String? resultado) {
  /// Verificamos si el resultado es null
  if (resultado == null) {
    return 0;
  }

  /// Convertimos el string a una lista de resultados
  List<String> resultados = resultado
      .replaceAll('[', '')
      .replaceAll(']', '')
      .replaceAll('"', '')
      .split(',');

  /// Inicializamos los contadores de sets ganados
  int pareja1Wins = 0;
  int pareja2Wins = 0;

  /// Contamos cuántos sets ganó cada pareja
  for (String set in resultados) {
    set = set.trim(); // Eliminamos los espacios en blanco
    List<String> scores = set.split('/');
    int score1 = int.parse(scores[0]);
    int score2 = int.parse(scores[1]);

    if (score1 > score2) {
      pareja1Wins++;
    } else {
      pareja2Wins++;
    }
  }

  /// Determinamos el ganador
  if (pareja1Wins > pareja2Wins) {
    return 1; // Gana la pareja 1
  } else if (pareja2Wins > pareja1Wins) {
    return 2; // Gana la pareja 2
  } else {
    return 0; // En caso de empate, aunque esto no debería ocurrir en un partido válido
  }
}

double widthRanking(
  double width,
  int ranking,
) {
  // Retorna el width de el LineChart del ranking

  // Calcular el ancho máximo de la barra
  double maxWidth = width - 170;

  // Calcular el porcentaje del ranking dentro de su categoría
  double percentage = (ranking % 100) / 100.0;

  // Calcular el ancho de la barra en función del porcentaje
  double barWidth = maxWidth * percentage;

  // Asegurarse de que el ancho mínimo sea 25 píxeles
  if (barWidth < 30) {
    barWidth = 30;
  }

  return barWidth;
}

int numberRanking(
  String rankingConvertido,
  int posicion,
) {
  // Retorna segun la posicion la liga actual o la siguiente

  int primerDigitoConvertido = int.parse(rankingConvertido.split('.')[0]);

  // Devolver el primer dígito o el primer dígito menos 1 según la posición
  if (posicion == 1) {
    return primerDigitoConvertido;
  } else if (posicion == 2) {
    return primerDigitoConvertido - 1;
  } else {
    throw ArgumentError('La posición debe ser 1 o 2');
  }
}

String processDateTime(String horaDeInicio) {
  // Convertir la Hora Inicio a un formato numérico sin dos puntos (ej. "18:00" a "1800").
  final horaInicio = horaDeInicio.replaceAll(':', '');
  int horaInicioNumero = int.parse(horaInicio);

  // Sumar una hora (100) al número de hora de inicio
  int horaFinalNumero = horaInicioNumero + 100;

  // Convertir el número de hora final a una cadena con formato "HH:mm", asegurando dos dígitos para horas y minutos
  String horaFinal =
      "${(horaFinalNumero ~/ 100).toString().padLeft(2, '0')}:${(horaFinalNumero % 100).toString().padLeft(2, '0')}";

  return horaFinal; // Retornar directamente la hora formateada como String
}

String? ligaDate(
  String fechaInicio,
  String fechaFin,
) {
  if (fechaInicio == null || fechaFin == null) return null;

  // Función auxiliar para formatear la fecha.
  String formatearFecha(String fecha) {
    List<String> meses = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic'
    ];

    // Separar la parte de la fecha de la parte del tiempo
    String fechaParte = fecha.split('T')[0];

    List<String> partes = fechaParte.split('-');
    if (partes.length != 3) {
      throw FormatException('El formato de la fecha debe ser yyyy-MM-dd');
    }

    String ano = partes[0];
    String mes = meses[int.parse(partes[1]) - 1];
    String dia = partes[2];

    return '$dia $mes $ano';
  }

  try {
    String inicioFormateado = formatearFecha(fechaInicio);
    String finFormateado = formatearFecha(fechaFin);
    String anoInicio = inicioFormateado.split(' ').last;
    String anoFin = finFormateado.split(' ').last;

    // Si los años son iguales, no repetir el año en la fecha de inicio.
    if (anoInicio == anoFin) {
      inicioFormateado = inicioFormateado.replaceFirst(' $anoInicio', '');
    }

    return 'Del $inicioFormateado al $finFormateado';
  } catch (e) {
    // Si algo sale mal, por ejemplo, si la fecha es inválida, retorna null.
    return null;
  }
}

bool isInscrito(
  List<LigaParejasRow>? listaInscritos,
  String userId,
) {
  if (listaInscritos == null) {
    return false;
  }

  for (var inscrito in listaInscritos) {
    if (inscrito.userId1 == userId || inscrito.userId2 == userId) {
      return true;
    }
  }

  return false;
}

List<int> queCategoria(
  List<LigaParejasRow> listaParejas,
  String userId,
) {
  List<int> categoriasInscritas = [];

  for (var pareja in listaParejas) {
    if (pareja.userId1 == userId || pareja.userId2 == userId) {
      if (pareja.categoriaId != null) {
        categoriasInscritas.add(
            pareja.categoriaId!); // Usa el operador ! para no-null assertion
      }
    }
  }

  return categoriasInscritas;
}

List<int> queCategoria2(
  List<TorneoParejasRow> torneoParejas,
  String userId,
) {
  List<int> categoriasInscritas = [];

  for (var pareja in torneoParejas) {
    if (pareja.userId1 == userId || pareja.userId2 == userId) {
      if (pareja.categoriaId != null) {
        categoriasInscritas.add(
            pareja.categoriaId!); // Usa el operador ! para no-null assertion
      }
    }
  }

  return categoriasInscritas;
}

bool isInscrito2(
  List<TorneoParejasRow>? listaInscritos,
  String userId,
) {
  if (listaInscritos == null) {
    return false;
  }

  for (var inscrito in listaInscritos) {
    if (inscrito.userId1 == userId || inscrito.userId2 == userId) {
      return true;
    }
  }

  return false;
}
