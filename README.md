
























Objetivos del Proyecto
   Desarrollar un sistema de gestión académica que permita a los profesores administrar de manera eficiente las calificaciones de sus estudiantes, planificar objetivos de aprendizaje por cortes evaluativos, y generar reportes estadísticos automatizados. El propósito es facilitar la labor docente mediante la centralización de notas y calificaciones, la automatización de cálculos de promedios, la visualización gráfica del rendimiento estudiantil, y la evaluación por competencias y objetivos de aprendizaje, fomentando así una gestión académica más eficiente y un seguimiento personalizado del progreso de cada estudiante.

Alcance del Proyecto
El presente proyecto contempla el desarrollo de una plataforma de gestión académica orientada a facilitar la labor docente en el registro, seguimiento y evaluación del rendimiento estudiantil. Entre sus principales funcionalidades se incluye un sistema de gestión de cuentas de profesor, vinculado a una base de datos segura, que permite el registro de nuevos docentes y el acceso personalizado a la herramienta.
La interfaz ha sido diseñada con un enfoque intuitivo y amigable, incorporando un menú interactivo desde el cual el profesor puede gestionar distintas áreas del sistema. Cada sección proporciona funcionalidades específicas, incluyendo el registro y administración de materias, la carga de estudiantes (tanto manual como mediante archivos CSV), y la planificación de objetivos de aprendizaje organizados en cuatro cortes evaluativos, cada uno con un peso del 25% sobre la nota final.
Además, se integra un módulo de evaluación por actividades, donde el profesor puede registrar calificaciones y observar automáticamente el cálculo de notas ponderadas. Esta funcionalidad permite reforzar la comprensión del rendimiento estudiantil mediante la actualización dinámica de los promedios por corte y final.
Finalmente, el sistema incluye un módulo de reportes estadísticos avanzados, que genera gráficos de histograma y curva de Gauss, calcula indicadores como media, varianza y desviación estándar, y clasifica a los estudiantes por su nivel de desempeño (aprobados, reprobados, regulares y excelentes). Todo ello con el objetivo de brindar al docente herramientas visuales y analíticas que faciliten la toma de decisiones académicas.



Requisitos Técnicos - UniScore
Lenguaje de Programación
Java SE 20.0 o superior
Utilizado para toda la lógica del programa y la interfaz gráfica.
Compatible con Swing y bibliotecas externas como MySQL Connector/J.
Requiere instalación del JDK correspondiente.
Entorno de Desarrollo
Apache NetBeans IDE 25 o superior
IDE principal para codificación, depuración y diseño de interfaz.
Compatible con proyectos Maven y gestión de librerías externas.
Soporte completo para Java 20 y desarrollo en Swing.
Frameworks y Librerías
Java Swing
Para construir interfaces gráficas modulares, intuitivas y responsivas.
Permite integración de componentes como botones, paneles, tablas, campos de texto y menús.
MySQL Connector/J
Para la conexión y comunicación con la base de datos MySQL.
Soporta consultas SQL, transacciones y gestión de conexiones.




AbsoluteLayout
Para diseño de interfaces con posicionamiento absoluto de componentes.
Facilita la creación de formularios complejos con NetBeans.
Integrado nativamente en el IDE.
Rendimiento Esperado
•	Carga de interfaz en menos de 5 segundos en equipos estándar
•	Manipulación fluida de hasta 300 estudiantes por materia sin pérdida de rendimiento
•	Respuesta inmediata en interacciones con el usuario (menús, formularios, tablas)
•	Generación de gráficos estadísticos en menos de 3 segundo
Restricciones Técnicas
•	Swing no es compatible con navegadores web (solo aplicaciones de escritorio)
•	Requiere instalación local del JDK y configuración manual de la base de datos MySQL
•	No se recomienda para dispositivos móviles o sistemas con recursos limitados (menos de 4GB RAM)
•	El servidor MySQL debe estar accesible para el correcto funcionamiento del sistema






Primeros pasos
Registro de profesor
1.	Al abrir la aplicación, verás la pantalla de inicio de sesión.
2.	Haz clic en el botón "Registrarse".
3.	Completa el formulario con tus datos:
o	Nombre completo
o	Correo electrónico
o	Contraseña
o	Especialidad

4.	Haz clic en "Registrarse".
5.	Serás redirigido automáticamente a la pantalla de inicio de sesión.
Inicio de sesión
1.	Ingresa tu correo electrónico y contraseña.
2.	Haz clic en "Iniciar sesión".
3.	Si los datos son correctos, accederás al Panel principal.

Panel principal
El panel principal tiene tres áreas:
Área	Descripción
Barra lateral izquierda	Menú de navegación con todas las funciones
Panel superior	Accesos rápidos y nombre del profesor
Área central (blanca)	Aquí se mostrarán todas las vistas al seleccionar una opción

Opciones del menú lateral
Ícono	Opción	Función
🏠	Inicio	Pantalla de bienvenida
📚	Registrar asignaturas	Crear/editar/eliminar materias
👨‍🎓	Reg. estudiantes	Registrar estudiantes por materia
🎯	Objetivo de curso	Planificar objetivos y actividades por corte
📝	Nota por Objetivo	Registrar notas de actividades
📊	Promedio	Calcular promedios finales
📋	Ver listado	Ver notas por estudiante
📈	Estadística	Reportes gráficos y análisis
⚙️	Configuración	Perfil, cambio de clave, cierre de semestre
🚪	Salir	Cerrar sesión
Gestión de materias
Crear una materia
1.	En el menú lateral, haz clic en "Registrar asignaturas".
2.	En el campo de texto, escribe el nombre de la materia (solo letras).
3.	Haz clic en "Guardar".
4.	La materia aparecerá en la tabla inferior.
Editar una materia
1.	En la tabla, haz clic en el ícono 📝 (editar) de la materia que deseas modificar.
2.	El nombre se cargará en el campo de texto.
3.	Modifica el nombre y haz clic en "Guardar".
Eliminar una materia
1.	En la tabla, haz clic en el ícono ❌ (eliminar).
2.	Confirma la acción en el mensaje de advertencia.
3.	Nota: No se puede eliminar una materia que tenga estudiantes o calificaciones asociadas.

Gestión de estudiantes
Agregar estudiante manualmente
1.	En el menú lateral, haz clic en "Reg. estudiantes".
2.	Selecciona una materia del combo desplegable.
3.	Ve a la pestaña "Registro manual".
4.	Completa:

o	Nombre completo
o	Cédula (solo números)
5.	Haz clic en "Guardar".
Cargar estudiantes por CSV
1.	Selecciona la materia correspondiente.
2.	Ve a la pestaña "Carga CSV".
3.	Haz clic en "Selecciona Archivo CSV".
4.	El archivo debe tener el formato: nombre,cedula
text
Juan Pérez,12345678
María Gómez,87654321
5.	El sistema mostrará un resumen de estudiantes cargados.
Eliminar estudiante
1.	En la tabla de estudiantes, haz clic en la columna "ELIMINAR".
2.	Confirma la acción.
Planificación de objetivos y actividades
Crear objetivo por corte
1.	Ve a "Objetivo de curso".
2.	Selecciona:
o	Materia
o	Corte (1 al 4)
3.	Completa:
o	Objetivo del corte (título)
o	Descripción
4.	En la tabla de actividades: 
o	Haz clic en "+Agregar Actividad"
o	Escribe el nombre y el porcentaje de cada actividad
o	La suma de porcentajes debe ser exactamente 25%
5.	Haz clic en "guardar Corte".
Editar objetivo existente
1.	Selecciona la materia y corte que ya tienen un objetivo guardado.
2.	Los datos se cargarán automáticamente.
3.	Realiza los cambios y haz clic en "guardar Corte" (se actualizará automáticamente).
Registro de notas por actividad
1.	Ve a "Nota por Objetivo".
2.	Selecciona en orden:
o	Materia
o	Corte
o	Actividad (aparecen las actividades previamente planificadas)
3.	En la tabla, ingresa las notas (0-20) para cada estudiante.
4.	Haz clic en "Guardar Notas".
5.	El sistema calculará automáticamente:
o	Nota ponderada (sobre el porcentaje de la actividad)
o	Actualización del corte en la tabla de calificaciones


Carga de notas por CSV
1.	Selecciona materia, corte y actividad.
2.	Haz clic en "Carga notas CSV".
3.	El archivo debe tener el formato: cedula,nota
text
12345678,15
87654321,18
4.	El sistema buscará a los estudiantes por su cédula y asignará las notas.
5.	Luego, haz clic en "Guardar Notas" para confirmar los cambios.
Cálculo de promedios
1.	Ve a "Promedio".
2.	Selecciona una materia.
3.	La tabla mostrará automáticamente:
o	Cédula
o	Nombre
o	Corte 1 (0-5)
o	Corte 2 (0-5)
o	Corte 3 (0-5)
o	Corte 4 (0-5)
o	Promedio Final (0-20)
4.	Haz clic en "Guardar Notas" para actualizar los registros en la base de datos.



Listado de notas
1.	Ve a "Ver listado".
2.	Selecciona:
o	Materia
o	Corte (1 al 4)
o	Actividad (opcional: para ver notas de una actividad específica)
3.	La tabla mostrará:
o	Estudiante
o	Cédula
o	Nota
o	Estado (APROBADO/REPROBADO)
4.	Usa el campo "Buscar Estudiante" para filtrar por nombre o cédula.
Estadísticas y reportes gráficos
1.	Ve a "Estadística".
2.	Selecciona:
o	Materia
o	Tipo de nota:
	General (promedio final 0-20)
	Corte 1 / Corte 2 / Corte 3 / Corte 4 (escala 0-5)
o	Actividad (opcional, disponible cuando seleccionas un corte)
3.	Haz clic en "generar".


Reportes generados:
Indicador	Descripción
Media	Promedio de notas
Varianza	Dispersión de los datos
Desviación Estándar	Medida de variabilidad
Aprobados	Nota ≥ 10 (en escala 20) o ≥ 3 (en escala 5)
Reprobados	Nota < umbral
Regulares	12-15 (escala 20) / 3.5-4.5 (escala 5)
Excelentes	> 15 (escala 20) / > 4.5 (escala 5)
Porcentaje de Aprobación	% de estudiantes aprobados
Gráfico generado:
•	Barras: Distribución de notas en intervalos (0-2, 3-5, 6-8, 9-11, 12-14, 15-17, 18-20)
•	Curva Gauss: Campana de distribución normal ajustada a los datos
•	Línea punteada azul: Marca el valor de la media
Semáforo de colores:
Color	Significado
🟢 Verde	Valor óptimo
🟠 Naranja	Valor aceptable
🔴 Rojo	Valor mejorable
Configuración del perfil
Actualizar datos personales
1.	Ve a "Configuración".
2.	En el combo, selecciona "Actualizar datos personales".
3.	Modifica:
o	Nombre completo
o	Correo electrónico
o	Especialidad
4.	Haz clic en "modificar".
Cambiar contraseña
1.	Selecciona "Cambiar clave".
2.	Ingresa:
o	Clave actual
o	Nueva clave
o	Confirmar nueva clave
3.	Haz clic en "Cambiar Clave".

Cierre de semestre
1.	Ve a "Configuración".
2.	Selecciona "Cerrar semestre".
3.	Haz clic en "Cerrar Semestre".
4.	Confirmar la acción.
¿Qué hace esta función?

Acción	Descripción
Respaldo CSV	Exporta todas las tablas principales a una carpeta con timestamp
Limpieza	Elimina todos los registros de: calificaciones, objetivos, estudiantes y materias

⚠️ Importante: Esta acción es irreversible. Asegúrate de tener respaldos antes de proceder.
Solución de problemas comunes
Error de conexión a la base de datos
•	Verifica que MySQL esté ejecutándose.
•	Confirma que la configuración en Conexion.java sea correcta:
java
private static final String URL = "jdbc:mysql://localhost:3306/academia_rendimiento";
private static final String USER = "root";
private static final String PASSWORD = "tu_contraseña";
No aparecen materias en los combos
•	Asegúrate de haber iniciado sesión correctamente.
•	Verifica que el profesor tenga materias registradas.
No se pueden eliminar estudiantes o materias
•	Puede haber registros relacionados (calificaciones, notas de actividades).
•	Elimina primero los datos dependientes o usa la opción "Cerrar semestre".
La suma de porcentajes no es 25%
•	Verifica que la suma de los porcentajes de las actividades del corte sea exactamente 25%.
•	Ajusta los valores hasta que el acumulado muestre texto verde.
Error en carga CSV de estudiantes
•	Formato correcto: nombre,cedula
•	Sin espacios adicionales.
•	La cédula debe contener solo números.









Recursos - UniScore
El desarrollo del proyecto requiere una combinación de recursos humanos, tecnológicos y temporales que garanticen su correcta ejecución y funcionalidad.
Recursos Humanos
Equipo Desarrollador: responsable del diseño, codificación, pruebas y documentación del sistema. Encargado de integrar las funcionalidades de gestión académica, planificación por cortes y reportes estadísticos.
Equipo de Asesoría Académica: Apoyo externo de la docente para validar la claridad del flujo de trabajo, la adecuación de los cortes evaluativos (25% cada uno) y la utilidad de los reportes estadísticos para la toma de decisiones.
Equipo de Testeo: Profesora que participara en la fase de validación y retroalimentación, probando el registro de notas, la carga CSV y la generación de gráficos.
Recursos Tecnológicos
Software:
•	Apache NetBeans IDE 25 o superior (Entorno de Desarrollo)
•	JDK 20.0.2 (Java Development Kit)
•	MySQL Connector/J 8.0 o superior (Librería de conexión)
•	Swing (incluido en Java) para interfaces gráficas
•	AbsoluteLayout de NetBeans para diseño de formularios
Hardware:
•	Computadora personal con arquitectura de 64 bits
•	Sistema Operativo Windows 10/11, Linux o macOS
•	Mínimo 8 GB de RAM y procesador de 4 núcleos para garantizar fluidez en desarrollo y pruebas
•	Resolución mínima recomendada: 1280x720 píxeles
Recursos Temporales
•	Disponibilidad de 7 horas diarias
•	Trabajo de 6 días a la semana (No contando posibles contratiempos)
•	Duración estimada del proyecto: 8 a 12 semanas
Apoyo Externo

•	Consulta a docente para validar los flujos de evaluación por cortes
•	Pruebas con profesora voluntaria que utilizo el sistema para la carga de nota
•	Documentación oficial de Oracle (Java), MySQL y Apache NetBeans

Plan de Pruebas y Validación - UniScore
El proceso de validación y testeo del sistema será llevado a cabo de manera rigurosa por el equipo de desarrollo, con el objetivo de garantizar su correcto funcionamiento, estabilidad y cumplimiento de los requerimientos establecidos. Esta etapa incluirá pruebas técnicas internas, orientadas a verificar la integridad de la base de datos, la precisión de los cálculos automáticos de notas ponderadas y promedios, y la eficiencia de la interfaz gráfica desarrollada con Java Swing.

Este enfoque colaborativo permitirá identificar oportunidades de mejora y asegurar que el sistema responda efectivamente a las necesidades del docente en su labor académica diaria.





Documentación - UniScore
Una vez finalizado el desarrollo del proyecto, este será entregado formalmente a la entidad responsable de su adquisición, acompañado de un manual de uso detallado. Dicho manual incluirá instrucciones precisas sobre el funcionamiento de cada una de las funcionalidades del sistema, los alcances del proyecto, así como información adicional destinada a optimizar la experiencia del usuario final.
Con el objetivo de facilitar futuras revisiones, mantenimientos o ampliaciones del sistema, el código fuente será entregado con comentarios explicativos en aquellas secciones que puedan resultar complejas o poco intuitivas. Esta documentación interna permitirá a otros desarrolladores comprender con mayor claridad la lógica implementada, brindando una guía útil para la navegación y modificación del código.
Este enfoque integral busca no solo garantizar la correcta implementación del sistema, sino también asegurar su sostenibilidad y escalabilidad a largo plazo.
 








Generador  de reporte estadístico- UniScore
Manual de Uso
Título del Manual: Manual de Usuario - UniScore
Versión: 1.0
Fecha de Publicación: mayo de 2026
Autoría y Entidad Desarrolladora
Este proyecto y su documentación fueron realizados con dedicación por un equipo de estudiantes de la UNEFA:

Desarrolladores y Autores
•	Yetsuri Key
•	LIzmaireth Mezones
•	Samuel Marin
•	Sebastian Salcedo
•	Irak Roja
•	Maria Rivas 

•	Entidad Responsable
Realizado por: UNEFISTAS (Equipo de la Universidad Nacional Experimental Politécnica de la Fuerza Armada Nacional Bolivariana)
Aviso Legal y Contacto
Derechos de Autor (Copyright):
© 2026 UniScore / UNEFISTAS. Todos los derechos reservados.
Queda prohibida la reproducción total o parcial de este manual, por cualquier medio o procedimiento, sin la previa autorización por escrito de los autores o la entidad responsable.
Contacto y Soporte:   sistema.uniscore@gmail.com
