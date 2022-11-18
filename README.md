

### STAPi Resureccion
```
   _____ _______       _____ _ 
  / ____|__   __|/\   |  __ (_)  SYSTEM
 | (___    | |  /  \  | |__) |   TARGETED
  \___ \   | | / /\ \ |  ___/ |  ATTACK
  ____) |  | |/ ____ \| |   | |  WITH
 |_____/   |_/_/    \_\_|   |_|R RASPBERRY Pi
 ############################################
     ###### BIENVENIDO A STAPi ########    
```

STAPi
==========


Stapi automatiza algunas funciones que quizá sean de tu interés en tu raspberry:

- Crear punto de acceso en modo nat.
- Crear punto de acceso en modo bridge.
- Crear portal cautivo (nodogsplash)
- Crear punto de acceso router tor.
- Crear punto de acceso maná.
- Wardriving.
- Captura PBC WPS
- Conexioón reversa tunelizada ssh. PiTunel.

Está escita en bash y pensada para usarla solo en modo consola. Nunca se usa el modo gráfico.


Documentacion de STAPi
======================
--Importante--
STAPi siempre se manejará con el usuario root.

--Instalación--
https://www.youtube.com/watch?v=QcOUpD-IrJ0

--Router Tor con STAPi--
https://www.youtube.com/watch?v=jSidmBbB06Y

Soporte de STAPi
================

Para cualquier duda, aclaracion o comentario, pueden hacerlo en el hilo previsto para ello en el foro wifi-libre:

https://www.wifi-libre.com/topic-1690-stapi-resureccion.html

Instrucciones de instalacion:
==============================
Previo a la instalción deberás descargarte la version de kali correspondiente a tu raspberry e instalara. 
En estos momentos (nov. 2022) la versión es la 2022.3. Puedes descargarte la neva version aquí:

https://www.kali.org/get-kali/#kali-arm

Luego en su consola, comienza la instalación:

1./ STAPi siempre funciona bajo el usuario root. De otra manera no funcionará. Vamos a asignar una contraseña a root:
```
sudo passwd root
```
Aquí nos pedirá una contraseña para root, y verificarla.

2./ Nos autenticamos como root
```
su root
```
Nos perdirá la contraseña de root

3./ Y por ultimo, bajamos el proyecto y lo instalamos.
```
git clone https://github.com/javierbu/STAPi_r.git
cd STAPi_r
./install
```

Durante el proceso de instalación, cualquier pregunta se responde con enter, tan fácil como en windows.

Uso:
====

Una vez instalado STAPi, escribe  ``` constructor ``` y configura el modulo que quieras usar.
```

   ___|                          |                           |                  
  |        _ \    __ \     __|   __|    __|   |   |    __|   __|    _ \     __| 
  |       (   |   |   |  \__ \   |     |      |   |   (      |     (   |   |    
 \____|  \___/   _|  _|  ____/  \__|  _|     \__,_|  \___|  \__|  \___/   _| By chewwe    

 Esto es el constructor. Es nuestro programa de carga 

  El cuerpo no puede vivir sin la mente

[::] Elige una de las siguientes opciones:

     [ 1 ] Configurar datos de PiTunel
     [ 3 ] Iniciar conectando automaticamente a una red  (Debes saber las credenciales)
     [ 7 ] Iniciar con ataque mana
     [ 9 ] Iniciar con Wardriving
     [ 10] Iniciar con router tor
     [ 11] Iniciar creando un punto de acceso modo bridge (puente)
     [ 12] Iniciar con PBC-bucle. (Recoje todas las pulsaciones y sus WPA al alcance.)
     [ 13] Iniciar creando un punto de acceso modo nat. (permite usar wlan0)
     [ 14] Iniciar creando un portal cautivo (nodogsplash). (permite usar wlan0)

     [000] Descargar scripts al inicio (Solo quedara cargado PiTunel)
     [111] Descargar todos los scripts de inicio, incluso PiTunel del inicio
     [ 0 ] Salir

[??] Opcion: 
```
