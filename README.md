

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


Stapi automatiza algunas funciones que quiza sean de u interes en tu raspberry:

- Crear punto de acceso en modo nat.
- Crear punto de acceso en modo bridge.
- Crear punto de acceso router tor.
- Crear punto de acceso mana.
- Wardriving.
- Captura PBC WPS
- Conexion tunelizada ssh. PiTunel.

Esta escita en bash y pensada para usarla solo en modo consola. Nunca se usa el modo grafico.
No se ha probado en kali linux de escritorio, pero deberia funcionar igualmente si no todo, casi todo.


Documentacion de STAPi
======================
--Importante--
STAPi siempre se manejara con el usuario root.

Instrucciones de instalacion:
==============================
Previo a la instalcion deberas descargarte la version de kali correspondiente a tu raspberry e instalara. 
En estos momentos la version es la 2022.3. Puedes descargarte la neva version aqui:

https://www.kali.org/get-kali/#kali-arm

Luego en su consola, comienza la instalacion:

1./ STAPi siempre funciona bajo el usuario root. De otra manera no funcionaria. Vamos a asignar una contrase;a a root:
```
sudo passwd root
```
Aqui nos pedira una contrase;a para root, y verificarla.

2./ Nos autenticamos como root
```
su root
```
Nos perdira la contrase;a de root

3./ Y por ultimo nos movemos al diretorio /root/, bajamos el proyecto y lo instalamos.
```
git clone https://github.com/javierbu/STAPi_r.git
cd STAPi_r
./install
```

Durante el proceso de instalacion, cualquier pregunta se responde con enter, tan facil como en windows.

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
     [ 11] Inicar creando un punto de acceso modo bridge (puente)
     [ 12] Inicar con PBC-bucle. (Recoje todas las pulsaciones y sus WPA al alcance.)
     [ 13] Inicar creando un punto de acceso modo nat. (permite usar wlan0)

     [000] Descargar scripts al inicio (Solo quedara cargado PiTunel)
     [111] Descargar todos los scripts de inicio, incluso PiTunel del inicio
     [ 0 ] Salir

[??] Opcion: 
```
