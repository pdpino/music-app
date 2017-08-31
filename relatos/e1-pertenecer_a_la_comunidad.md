# Épica 1: Pertenecer a la comunidad.

## Relato 1: Ingresar como usuario estándar vía mail/contraseña.
### Historia:
Yo como usuario estándar quiero poder ingresar a la plataforma usando mail/contraseña, para acceder a mis preferencias, contenidos, e interacciones sociales realizadas, para obtener satisfacción social.
### Validación:
* Usuario ingresa sus credenciales y logra acceder a su 'portal'.
* Usuario no logra ingresar con credenciales inválidas o inexistentes.

***

## Relato 2: Ingresar como usuario estándar vía facebook.
### Historia:
Yo como usuario estándar quiero poder ingresar a la plataforma usando mi cuenta de facebook, para acceder a mis preferencias, contenidos, e interacciones sociales realizadas, de manera fácil y conveniente, para obtener satisfacción social.
### Validación:
* Usuario ingresa con una cuenta de facebook previamente registrada, y logra ver su 'portal'.
* Usuario no logra ingresar con cuentas de facebook inválidas o no registradas.
* Usuario no logra ingresar si el permiso ha sido revocado.

***

## Relato 3: Ingresar como usuario administrador usando mail/contraseña
### Historia:
Yo como usuario administrador quiero poder ingresar a la plataforma, para acceder a mis preferencias, estadísticas, herramientas de gestión e indicadores, para poder dar soporte a la plataforma.
### Validación:
* Usuario ingresa sus credenciales y accede a su 'dashboard'.
* Usuario no logra ingresar con credenciales inválidas o inexistentes.

***

## Relato 4: Salir del sistema.
### Historia:
Yo como usuario (estándar o administrador), quiero (teniendo una sesión activa) poder salir del sistema, para obtener privacidad, seguridad y control sobre mi cuenta.
### Validación:
* Usuario (con sesión activa) lográ salir efectivamente de su cuenta.
* No hay forma de volver a ingresar como usuario estándar o administrador, si no es vía algún mecanismo de ingreso regular.

***

## Relato 5: Registrarse como usuario estándar usando mail y contraseña.
### Historia
Yo como usuario visitante quiero poder crear una nueva cuenta de usuario estándar asociada a una dirección de email y contraseña, para poder obtener los beneficios del sistema y ser parte de la comunidad.
### Validación:
* Un usuario estándar puede crear un nuevo usuario, provisto de un mail válido y contraseña aceptable.
* No se puede crear más de una cuenta asociada a un mismo mail.
* Contraseña debe ser aceptable (más de 6 caracteres, incluir alfanuméricos minúsculas, masyúsculas, numerales; y símbolos).

***

## Relato 6: Registrarse como usuario estándar usando integración con facebook.
### Historia
Yo como usuario visitante quiero poder crear una nueva cuenta de usuario estándar, asociada a una cuenta de facebook, para poder obtener los beneficios del sistema y ser parte de la comunidad.
### Validación:
* Un usuario estándar puede crear un nuevo usuario, provisto de una cuenta válida en facebook.
* No se puede crear más de una cuenta asociada a una cuenta de facebook.

***

## Relato 7: Asociar cuenta de sistema a cuenta de facebook.
### Historia:
Yo como usuario estándar con cuenta previamente no integrada a facebook, quiero poder integrar las dos plataformas para mejorar y maximizar la experiencia social.
### Validación:
* Usuario puede asociar su cuenta de usuario estándar (creada con mail/contraseña) a su cuenta de facebook (provisto que la cuenta de facebook sea válida).
* Al intentar integrar una cuenta previamente integrada (por creación o porque ya se había integrado), no hay efectos indeseados (eliminación/reestablecimiento de datos, duplicación de cuentas, etc).

***

## Relato 8: Reestablecer contraseña.
### Historia:
Yo como usuario estándar (que creo su cuenta con un par email/contraseña) quiero poder reestablecer mi contraseña, para recuperar el acceso a mi cuenta.
### Validación:
* Usuario logra crear nueva contraseña (provisto que sea aceptable (más de 6 caracteres, incluir alfanuméricos minúsculas, masyúsculas, numerales; y símbolos)) e ingresar con ella.
* Usuario no logra re-establecer la contraseña si creo su cuenta usando facebook.
* Usuario administrador no puede re-establecer su contraseña usando éste mecanísmo.

***

## Relato 9: Editar datos básicos de perfil.
### Historia:
Yo como usuario (estándar o administrador), quiero editar (agregar, cambiar o elminar) mis datos básicos (username, nombre, apellido, preferencias musicales, otros emails de contacto) para darme a conocer ante la comunidad.  
### Validación:
* Usuario puede ingresar, cambiar o eliminar username, nombre, apellido, preferencias musicales, y otros emails de contacto; los datos persisten y los datos anteriores dejan de mostrarse dentro de la plataforma.

***

## Relato 10: Editar contraseña.
### Historia:
Yo como usuario (estándar (con cuenta creada usando email/contraseña) o administrador) quiero poder modificar mi contraseña de ingreso a la plataforma, para mejorar el control sobre mi privacidad y seguridad.
### Validación:
* Usuario logra crear una nueva contraseña, provisto a que sea aceptable (más de 6 caracteres, incluir alfanuméricos minúsculas, masyúsculas, numerales; y símbolos).
* Usuario no logra crear una nueva contraseña, si ésta no es aceptable.
* Usuario puede ingresar al sistema con nueva contraseña
* Usuario no puede ingresar al sistema con contraseña antigua.

***

## Relato 11: Editar Foto de perfil.
### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar, cambiar o eliminar mi (única) imagen de perfil, para darme a conocer ante la comunidad.
### Validación:
* Si agregó/reemplazó una imagen, ésta es visible como tal.
* Imagen anterior (si es que había) desaparece completamente del sistema, no hay forma de verla.
