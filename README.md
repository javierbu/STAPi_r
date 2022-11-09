

### STAPi Resureccion
```
   _____ _______       _____ _ 
  / ____|__   __|/\   |  __ (_)  SYSTEM
 | (___    | |  /  \  | |__) |   TARGETED
  \___ \   | | / /\ \ |  ___/ |  ATTACK
  ____) |  | |/ ____ \| |   | |  WITH
 |_____/   |_/_/    \_\_|   |_|  RASPBERRY Pi
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
```
sudo passwd root
su
cd
git clone https://github.com/javierbu/STAPi_r.git
cd STAPi_r
./install
```
Durante el proceso de instalacion, cualquier pregunta se responde con enter, tan facil como en windows.

