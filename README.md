# Cuentamuertes web
----
## Definición de proyecto
El cuentamuertes web es un hobby project inspirado por la necesidad de los streamers de tener un cuentamuertes versátil y personalizable que les permita tener estadísticas de muerte detalladas y completas en un espacio accesible sin necesidad de saber de tratamiento estadístico.

Para cumplir esta tarea se creó este cuentamuertes basado en tecnologías web para su parte frontal, utilizando HTML, CSS estático y PHP puro, para que la web tenga la menor carga posible, permitiendo así al streamer dedicar todos los recursos psoibles a la tarea de entretenimiento sin que una web pesada les relentice el trabajo.

## A quién va dirigido
Este proyecto va dirigido principalmente a creadores de contenido con un servidor disponible donde hostear esta aplicación web, para que cuenten las muertes mientras están en directo, ya que la hora de la muerte es la hora en la que se registra, por ello evita tener mucha carga visual y no consuma excesivos recursos. Pretende ser lo más rápida posible en contabilizar muertes, para que sea un momento contear la muerte y volver a la acción.

## Requisitos técnicos
Esta aplicación requiere:

- Tener instalado Python3
- Un servidor con sistema operativo `Debian 9` o superior o `Ubuntu 18.04` o superior.
- Tener instalado el webserver `Apache2`.
- Un dominio que apuntar a esta webApp.
- Tener instalada una instancia de `PostgreSQL` en este mismo servidor.
- Tener acceso a un usuario de PostgreSQL que pueda acceder por método remoto que pueda crar usuarios con permiso de `CREATEDB`.
- Tener acceso al usuario administrador del sistema, para poder ejecutar el script `installer.py` con el usuario `root`.
El script de instalación se ocupará del resto.

## Instalación
Descarga el repositorio posteado en esta misma página, descomprímela y entra a ella en una terminal.

Una vez compruebes que cumples los requisitos mencionados en el apartado de requisitos técnicos, ejecuta `python3 installer.py` y el instalador te guiará a través de toda la información que debes darle. Cuando éste termine tendrás un cuentamuertes funcional en la dirección web en el dominio que has especificado, en http. Si quieres aplicarle https, te sugiero que eches un ojo al proyecto de [link](https://certbot.eff.org/ "Certbot"), de la Electronic Frontier Foundation.

## Manual

### Inicio
Al entrar en la web encontraremos un panel que nos permitirá contar una muerte con el juego establecido apretando el botón `F, morición`. Cuando demos click a este botón, nos llevará a una web que contabiliza la muerte automáticamente para el juego establecido y la sesión de juego que hayamos especificado en el inicio (por defecto la última sesión registrada del juego seleccionado) y nos devolverá al inicio, donde veremos en la tabla la muerte en la tabla de estadísticas. 

Por esto, al principio de cada sesión se debería comprobar que se están contando las muertes para el juego correcto y la sesión es la correspondiente.

### Cambiar y crear juegos
Si entramos por primera vez al panel web no habrá juego para el que contabilizar muertes. Para ello podemos entrar al botón `Cambiar juego que contar`. Esto nos llevará a una web con dos formularios a elegir.

El primer formulario sirve para añadir un juego nuevo del que contar muertes. En este campo introduciremos el nombre de un juego, y cuando hagamos click en `Crear entrada de juego posible` lo añadirá a la base de datos, lo establecerá como juego activo, y nos llevará a la página inicial para contar muertes.

En el caso del segundo formulario es para los juegos que ya existen en la base de datos, donnde tenemos un listado de los existentes para cambiar a contabilizar muertes de uno o otro. Elegimos uno de la lista de desplegables y cuando hagamos click en `Elegir juego del que contar muertes` establecerá el juego elegido como activo y nos llevará a la página principal donde contabilizar muertes.

### Salón de las estadísticas
En el salón de las estadísticas podemos ver información de estadísticas sobre las muertes generales de todos los juegos, y cuánto peso tiene cada juego para el total de muertes, cuántas muertes tiene cada juego, cuáles tienen más y menos muertes en total, etcétera. Estas estadísticas se actualizan de forma automática con cada muerte.

### Panel de administración
Este panel muestra un historial de todas las muertes registradas en el cuentamuertes ordenado desde la más reciente primero. Nos muestra su id, su fecha y hora, su juego y su sesión, y nos da un botón que nos permite eliminar esta muerte del registro en caso de que se contabilizara de forma errónea.

Este apartado tiene un sistema que muestra **todas** las muertes registradas en la base de datos, porlo que hay que tener en cuenta que si el volumen de muertes es muy elevado, quizá esta página podría tardar un poco en generarse, es algo a vigilar y tener en cuenta.

### Integración con el chatbot de StreamElements
Si utilizas en tu canal el chatbot de [StreamElements](https://streamelements.com/), tienes disponible una API de integración con tu chat para que puedan consultar muertes sin necesidad de darles la página del cuentamuertes y exponerla.

Esto se basa en 2 comandos específicos: Uno que nos dará la lista de juegos a consultar, y uno que nos mostrará estadísticas del juego deseado.

En el caso del primero, añadiremos `${customapi.https://{Tu dominio elegido}/chatbot/juegos.php}` como comando, del estilo `!listajuegos`, y éste nos devolverá el listado de juegos registrados, por ejemplo `Hollow Knight,NieR: Automata ruta B, NieR: Automata ruta C`, separando cada entrada posibbble por comas.

Con los datos de este podremos utilizar el segundo comando que añadiremos, `${customapi.https://{Tu dominio elegido}/chatbot/total.php?game=$(queryencode $(1:))}`, con un comando del estilo `!muertesjuego`, el cual requiere como entrada uno de los juegos devueltos por la lista del comando anterior. Debe estar escrito exactamente igual que nos indica el comando. Si por ejemplo introducimos `!muertesjuego Hollow Knight` nos devolverá un texto del estilo de `tu streamer de confianza lleva 433 muertes en Hollow Knight (3 muertes en la última sesión registrada), que representa un 90.02% de las muertes registradas.`. En el caso de que el juego que pidamos esté mal escrito, o sea un juego que no exisste en la base de datos, se nos devolverá `ERROR, ese jeugo no está en la lista de juegos posibles.`.

## Contribuciones
Por el momento las contribuciones a este web project personal están cerradas, pero siempre puedes abrir una Issue en GitHub si encuentras algún error que intentaré solucionar en la medida de lo posible.

## Licencia
Ver el archivo LICENSE de la repo, ahí está la licencia completa. Software licenciado bajo la licencia de software libre `GNU General Public License v3.0`.

