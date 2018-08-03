opcion = 0

txt_menu = <<menu
  Seleccione una opcion:
  1. Ver nombre de alumno y su promedio de notas.
  2. Ver inasistencia total de cada alumno.
  3. Ver alumnos aprobados/reprobados.
  4. Salir.
menu

def opcion_1
  print "Ver nombre de alumnos y su promedio.\n\n"
  classroom = File.read('alumnos.csv')
  promedios = ''
  classroom.split("\n").map do |a|
    alumno = a.split(', ')
    name_alum = alumno[0]
    t = alumno.inject(0) { |suma, item| suma + item.to_i}
    promedio_alm = t.to_f / (alumno.length - 1)
    #promedios += "Alumno #{name_alum}, su promedio es: #{promedio_alm}\n"
    print "Alumno #{name_alum}, su promedio es: #{promedio_alm}\n"
  end
  #file.write('alumnos.csv', 'promedios')
  puts
end

def opcion_2
  print "Ver inasistencia total  de cada alumno.\n\n"
  classroom = File.read('alumnos.csv')
  classroom.split("\n").map do |a|
    alumno = a.split(', ')
    name_alum = alumno[0]
    inasistencia = alumno.select { |x| x == 'A'}
    print "Alumno #{name_alum}, inasistencia total: #{inasistencia.count}\n"
  end
  puts
end

def opcion_3
  print "Ver Alumnos aprobados y reprovados\n\n"
  classroom = File.read('alumnos.csv')
  classroom.split("\n").map do |a|
    alumno = a.split(', ')
    name_alum = alumno[0]
    t = alumno.inject(0) { |suma, item| suma + item.to_i}
    promedio_alm = t.to_f / (alumno.length - 1)
    alm_aprv = promedio_alm >= 5? 'Aprobado.' : 'Reprobado.'
    print "Alumno #{name_alum}, #{alm_aprv}\n"
  end
  puts
end

while opcion != 4
  puts
  print txt_menu
  opcion = gets.to_i
  case opcion
  when 1
    opcion_1
  when 2
    opcion_2
  when 3
    opcion_3
  when 4
    print "Elejiste salir\n"
  else
    print "Error de opcion\n"
  end
end
