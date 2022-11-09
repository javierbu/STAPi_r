

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
cd
git clone https://github.com/javierbu/STAPi_r.git
cd STAPi_r
./install
```

Durante el proceso de instalacion, cualquier pregunta se responde con enter, tan facil como en windows.

