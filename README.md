# Grupo 29!
Repositorio principal para el desarrollo del proyecto. Miembros del equipo: 

* <img src="https://github.com/pdpino.png?size=64" width="64" height="64" alt="pdpino">[ Pablo Pino](https://github.com/pdpino)
* <img src="https://github.com/dtfuller.png?size=64" width="64" height="64" alt="dtfuller">[ David Fuller](https://github.com/dtfuller)
* <img src="https://github.com/pdpino.png?size=64" width="64" height="64" alt="pdpino">[ Luciano Chiang](https://github.com/pdpino)

## Heroku
Se ha montado un ambiente de ejecución en heroku. [ Aquí hay un link a tal.](http://guarded-island-96195.herokuapp.com)

## Instrucciones generales.
### Base de Datos y configuración de ambiente (ubuntu, debian y similares)

* Crear un archivo llamado `.env` con los siguientes pares llave-valor (reemplazando con los valores correspondientes de la base de datos postgres): 

```sh
RAILS_ENV=development
DB_USERNAME=dbusername
DB_PASSWORD=dbpassword
DB_NAME=dbname
```

* Desde el terminal (y dentro del directorio de la aplicación) ejecutar `source .exportenv`

### Servidor web.

* Para levantar la apliación, desde el terminal (y dentro del directorio de la aplicación)  ejecutar 
```sh
bundle install
rails db:migrate
rails db:seed
rails server
```

## Entrega 1

### Historias pactadas. 
* Para describir las historias pactadas, se seguirá la convención  `NUMERO_DE_ÉPICA.numero_de_relato`. 

#### 1.2: Ingresar como usuario estándar vía facebook.
##### Historia:
Yo como usuario estándar quiero poder ingresar a la plataforma usando mi cuenta de facebook, para acceder a mis preferencias, contenidos, e interacciones sociales realizadas, de manera fácil y conveniente, para obtener satisfacción social.
##### Validación:
* Usuario ingresa con una cuenta de facebook previamente registrada, y logra ver su 'portal'.
* Usuario no logra ingresar con cuentas de facebook inválidas o no registradas.
* Usuario no logra ingresar si el permiso ha sido revocado.

#### 1.3: Ingresar como usuario administrador usando mail/contraseña
##### Historia:
Yo como usuario administrador quiero poder ingresar a la plataforma, para acceder a mis preferencias, estadísticas, herramientas de gestión e indicadores, para poder dar soporte a la plataforma.
##### Validación:
* Usuario ingresa sus credenciales y accede a su 'dashboard'.
* Usuario no logra ingresar con credenciales inválidas o inexistentes.


#### 1.4: Salir del sistema.
##### Historia:
Yo como usuario (estándar o administrador), quiero (teniendo una sesión activa) poder salir del sistema, para obtener privacidad, seguridad y control sobre mi cuenta.
##### Validación:
* Usuario (con sesión activa) lográ salir efectivamente de su cuenta.
* No hay forma de volver a ingresar como usuario estándar o administrador, si no es vía algún mecanismo de ingreso regular.


#### 1.5: Registrarse como usuario estándar usando mail y contraseña.
##### Historia
Yo como usuario visitante quiero poder crear una nueva cuenta de usuario estándar asociada a una dirección de email y contraseña, para poder obtener los beneficios del sistema y ser parte de la comunidad.
##### Validación:
* Un usuario estándar puede crear un nuevo usuario, provisto de un mail válido y contraseña aceptable.
* No se puede crear más de una cuenta asociada a un mismo mail.
* Contraseña debe ser aceptable (más de 6 caracteres, incluir alfanuméricos minúsculas, masyúsculas, numerales; y símbolos).


#### 1.9: Editar datos básicos de perfil.
##### Historia:
Yo como usuario (estándar o administrador), quiero editar (agregar, cambiar o elminar) mis datos básicos (username, nombre, apellido, preferencias musicales, otros emails de contacto) para darme a conocer ante la comunidad.  
##### Validación:
* Usuario puede ingresar, cambiar o eliminar username, nombre, apellido, preferencias musicales, y otros emails de contacto; los datos persisten y los datos anteriores dejan de mostrarse dentro de la plataforma.


#### 1.10: Editar contraseña.
##### Historia:
Yo como usuario (estándar (con cuenta creada usando email/contraseña) o administrador) quiero poder modificar mi contraseña de ingreso a la plataforma, para mejorar el control sobre mi privacidad y seguridad.
##### Validación:
* Usuario logra crear una nueva contraseña, provisto a que sea aceptable (más de 6 caracteres, incluir alfanuméricos minúsculas, masyúsculas, numerales; y símbolos).
* Usuario no logra crear una nueva contraseña, si ésta no es aceptable.
* Usuario puede ingresar al sistema con nueva contraseña
* Usuario no puede ingresar al sistema con contraseña antigua.

#### 1.11: Editar Foto de perfil.
##### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar, cambiar o eliminar mi (única) imagen de perfil, para darme a conocer ante la comunidad.
##### Validación:
* Si agregó/reemplazó una imagen, ésta es visible como tal.
* Imagen anterior (si es que había) desaparece completamente del sistema, no hay forma de verla.


#### 1.12: Crear Admins. 
##### Historia:
Yo como super usuario poder crear y eliminar cuentas de administrador, para poder delegar y gestionar el trabajo de administración sobre la plataforma.

##### Validación:
* Nuevo administrador puede ingresar usando par mail/contraseña creado. 
* Si el correo ya tenía una cuenta estándar asociada, se asocia una cuenta de administrador, adicional a la anterior. Usuario correpondiente puede seleccionar cuenta con la que quiere ingresar. 
* Si el superusuario 'elimina' a un administrador, este no puede ingresar a dicha cuenta. Si tenía asociada una cuenta de usuario estándar, aún puede ingresar a ésta.
* Administradores no pueden crear/eliminar a otros administradores.
* Superusuario no puede crear otros super usuarios. 
* Superusuario no puede eliminarse a sí mismo.


#### 2.1: Agregar canción al catálogo general.
##### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar una canción al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
##### Validación:
* Si la canción a agregar es parte de un álbum, el álbum debe existir previamente en el catálogo.
* Para una combinación (artista, álbum), no puede existir más de una canción con el mismo título.
* Se puede crear una canción como single, provisto que exista el/los artistas.
* Si usuario ingresa todos los valores 'correctamente', sistema muestra la nueva canción, disponible a todos los usuarios del sistema.


#### 2.2: Agregar álbum a catálogo general.
##### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar un álbum al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
##### Validación:
* El artísta del álbum debe existir previamente en el catálogo.
* Para un artista dado, no puede existir más de un álbum con el mismo nombre.
* Se puede crear una canción como single, provisto que exista el/los artistas.
* Si usuario ingresa todos los valores 'correctamente', sistema muestra el nuevo álbum, disponible a todos los usuarios del sistema.


#### 2.3: Agregar artista a catálogo general.
##### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar un artista al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
##### Validación:
* Si usuario ingresa todos los valores 'correctamente', sistema muestra el nuevo artista, disponible a todos los usuarios del sistema.
* Si el usuario ingresa un nombre de artista que ya existé en el catálogo, hay que notificar al usuario.


#### 2.4: Editar canción como usuario estándar.
##### Historia:
Yo como usuario estándar quiero poder editar (modificar o eliminar) una canción que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Usuario sólo puede editar canciones que él haya agregado.
* En el caso de editar una canción, los nuevos valores deben cumplir las validaciones descritas en el 2.1.
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.5: Editar canción como usuario administrador.
##### Historia:
Yo como usuario administrador quiero poder editar (modificar o eliminar) una canción creada previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* En el caso de editar una canción, los nuevos valores deben cumplir las validaciones descritas en el 2.1.
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.6: Modificar álbum como usuario estándar.
##### Historia:
Yo como usuario estándar quiero poder modificar un álbum que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Usuario sólo puede editar álbumes que él haya agregado.
* Los nuevos valores deben cumplir las validaciones descritas en el 2.2.
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.7: Modificar álbum como usuario administrador.
##### Historia:
Yo como usuario administrador quiero poder editar un álbum creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* los nuevos valores deben cumplir las validaciones descritas en el 2.2.
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.8: Eliminar álbum como usuario estándar.
##### Historia:
Yo como usuario estándar quiero poder eliminar un álbum que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Usuario sólo puede eliminar álbumes que él haya agregado.
* Álbum deja de ser visible, para cada usuario en el sistema.
* Canciones asociadas al álbum son eliminadas.


#### 2.9: Eliminar álbum como usuario administrador.
##### Historia:
Yo como usuario administrador quiero poder eliminar un álbum creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Álbum deja de ser visible, para cada usuario en el sistema.
* Canciones asociadas al álbum son eliminadas.


#### 2.10: Modificar artista como usuario estándar.
##### Historia:
Yo como usuario estándar quiero poder modificar un artista que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Usuario sólo puede editar artistaes que él haya agregado.
* Los nuevos valores deben cumplir las validaciones descritas en el 2.3.
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.11: Modificar artista como usuario administrador.
##### Historia:
Yo como usuario administrador quiero poder modificar un artista creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Cambios son visibles para todos los usuarios en el sistema.


#### 2.12: Eliminar artista como usuario estándar.
##### Historia:
Yo como usuario estándar quiero poder eliminar un artista que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* Usuario sólo puede eliminar artistas que él haya agregado.
* artista deja de ser visible, para cada usuario en el sistema.
* álbumes, singles y sus canciones asociadas al artista son eliminadas.


#### 2.13: Eliminar artista como usuario administrador.
##### Historia:
Yo como usuario administrador quiero poder eliminar un artista creado previamente (por usuario), para corregir algún error o para satisfacer aspectos de privacidad.
##### Validación:
* artista deja de ser visible, para cada usuario en el sistema.
* álbumes, singles y sus canciones asociadas al artista son eliminadas.

#### 2.23: Agregar/editar imagen de álbum.
##### Historia: 
Yo como usuario 'dueño' de un álbum (administrador, o estándar que lo creo), quiero poder agregar o modificar la imagen de portada de un álbum, para denotar correctamente el contenido del álum y obtener satisfacción por eso.
##### Validación
* Cambios de imagen son visibles para todo usuario en el sistema.
* No hay posibilidad de acceder a la imagen anterior (si es que había). 
* Usuario estándar no puede modificar la imagen de un álbum que no haya creado. 
* Usuario visitante no puede modificar ninguna imagen.
