# Épica 2: Manejar catálogo musical.

## Relato 1: Agregar canción al catálogo general.
### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar una canción al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
### Validación:
* Si la canción a agregar es parte de un álbum, el álbum debe existir previamente en el catálogo.
* Para una combinación (artista, álbum), no puede existir más de una canción con el mismo título.
* Se puede crear una canción como single, provisto que exista el/los artistas.
* Si usuario ingresa todos los valores 'correctamente', sistema muestra la nueva canción, disponible a todos los usuarios del sistema.

***

## Relato 2: Agregar álbum a catálogo general.
### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar un álbum al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
### Validación:
* El artísta del álbum debe existir previamente en el catálogo.
* Para un artista dado, no puede existir más de un álbum con el mismo nombre.
* Se puede crear una canción como single, provisto que exista el/los artistas.
* Si usuario ingresa todos los valores 'correctamente', sistema muestra el nuevo álbum, disponible a todos los usuarios del sistema.

***

## Relato 3: Agregar artista a catálogo general.
### Historia:
Yo como usuario (estándar o administrador) quiero poder agregar un artista al catálogo general (disponible para todos los usuarios), para poder aumentar el contenido disponible.
### Validación:
* Si usuario ingresa todos los valores 'correctamente', sistema muestra el nuevo artista, disponible a todos los usuarios del sistema.
* Si el usuario ingresa un nombre de artista que ya existé en el catálogo, hay que notificar al usuario.

***

## Relato 4: Editar canción como usuario estándar.
### Historia:
Yo como usuario estándar quiero poder editar (modificar o eliminar) una canción que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Usuario sólo puede editar canciones que él haya agregado.
* En el caso de editar una canción, los nuevos valores deben cumplir las validaciones descritas en el relato 1.
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 5: Editar canción como usuario administrador.
### Historia:
Yo como usuario administrador quiero poder editar (modificar o eliminar) una canción creada previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* En el caso de editar una canción, los nuevos valores deben cumplir las validaciones descritas en el relato 1.
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 6: Modificar álbum como usuario estándar.
### Historia:
Yo como usuario estándar quiero poder modificar un álbum que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Usuario sólo puede editar álbumes que él haya agregado.
* Los nuevos valores deben cumplir las validaciones descritas en el relato 2.
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 7: Modificar álbum como usuario administrador.
### Historia:
Yo como usuario administrador quiero poder editar un álbum creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* los nuevos valores deben cumplir las validaciones descritas en el relato 2.
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 8: Eliminar álbum como usuario estándar.
### Historia:
Yo como usuario estándar quiero poder eliminar un álbum que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Usuario sólo puede eliminar álbumes que él haya agregado.
* Álbum deja de ser visible, para cada usuario en el sistema.
* Canciones asociadas al álbum son eliminadas.

***

## Relato 9: Eliminar álbum como usuario administrador.
### Historia:
Yo como usuario administrador quiero poder eliminar un álbum creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Álbum deja de ser visible, para cada usuario en el sistema.
* Canciones asociadas al álbum son eliminadas.

***

## Relato 10: Modificar artista como usuario estándar.
### Historia:
Yo como usuario estándar quiero poder modificar un artista que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Usuario sólo puede editar artistaes que él haya agregado.
* Los nuevos valores deben cumplir las validaciones descritas en el relato 3.
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 11: Modificar artista como usuario administrador.
### Historia:
Yo como usuario administrador quiero poder modificar un artista creado previamente (por cualquier usuario), para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Cambios son visibles para todos los usuarios en el sistema.

***

## Relato 12: Eliminar artista como usuario estándar.
### Historia:
Yo como usuario estándar quiero poder eliminar un artista que yo haya creado previamente, para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* Usuario sólo puede eliminar artistas que él haya agregado.
* artista deja de ser visible, para cada usuario en el sistema.
* álbumes, singles y sus canciones asociadas al artista son eliminadas.

***

## Relato 13: Eliminar artista como usuario administrador.
### Historia:
Yo como usuario administrador quiero poder eliminar un artista creado previamente (por usuario), para corregir algún error o para satisfacer aspectos de privacidad.
### Validación:
* artista deja de ser visible, para cada usuario en el sistema.
* álbumes, singles y sus canciones asociadas al artista son eliminadas.

***

## Relato 14: Marcar canción como favorita.
### Historia:
Yo como usuario estándar, quiero marcar una canción como 'favorita' para guardar y recordar mis preferencias.
### Validación:
* Canción es agregada a la playlist 'canciones favoritas' (que cada usuario estándar tiene por defecto).

***

## Relato 15: Marcar álbum como favorito.
### Historia:
Yo como usuario estándar, quiero marcar un álbum como 'favorito' para guardar y recordar mis preferencias.
### Validación:
* álbum es agregado a la sección 'álbumes favoritos' (que cada usuario estándar tiene por defecto).

***

## Relato 16: Marcar artista como favorito.
### Historia:
Yo como usuario estándar, quiero marcar un artista como 'favorito' para guardar y recordar mis preferencias.
### Validación:
* Artista es agregado a la sección 'artistas favoritos' (que cada usuario estándar tiene por defecto).

***

## Relato 17: Desmarcar álbum de favorito.
### Historia:
Yo como usuario estándar, quiero desmarcar un álbum de 'favorito' para corregir un error, o reflejar un cambio en mis preferencias.
### Validación:
* álbum es quitado de la sección 'álbumes favoritos' (que cada usuario estándar tiene por defecto).

***

## Relato 18: Desmarcar artista como favorito.
### Historia:
Yo como usuario estándar, quiero desmarcar un artista de 'favorito' para corregir un error, o reflejar un cambio en mis preferencias.
### Validación:
* Artista es quitado dela sección 'artistas favoritos' (que cada usuario estándar tiene por defecto).

***

## Relato 19: Crear y eliminar una playlist como usuario estándar.
### Historia:
Yo como usuario estándar, quiero poder crear listas (pùblicas o privadas) de canciones, para poder reflejar y satisfacer mis gustos musicales.
### Validación:
* Si es playlist es creada como pública, todos los usuarios (visitas, estándares y administradores) pueden verla y acceder a ella.
* Si es playlist es creada como privada, sólo el usuario puede verla y acceder a ella.
* Al eliminar una playlist, canciones siguien existiendo independientemente (no-asociadas) en el catálogo general.

***

## Relato 20: Modificar playlist como usuario estándar.
### Historia:  
Yo como usuario estándar, quiero poder modificar (agregar, quitar y reordenar canciones; cambiar visibilidad (pública/privada)) playlists (pùblicas o privadas) que yo haya creado, para poder reflejar y satisfacer mis gustos musicales.
### Validación:
* Si playlist era pública y pasa a ser privada, sólo el usuario que la creo puede ver y acceder a ella.
* Si playlist era privada y pasa a ser pública, todos los usuarios (visitas, estándar, adminsitrador) pueden verla y acceder a ella.
* Canciones agregadas, quitadas y reordenadas son mostradas acordemente en la lista.

***

## Relato 21: Crear y eliminar una playlist como usuario administrador.
### Historia:
Yo como usuario administrador, quiero poder crear playlists (pùblicas o privadas), para generar contenido para los usuarios visita o estándares.
### Validación:
* Si es playlist es creada como pública, todos los usuarios (visitas, estándares y administradores) pueden verla y acceder a ella.
* Si es playlist es creada como privada, sólo los administradores pueden verla y acceder a ella.
* Al eliminar una playlist, canciones siguien existiendo independientemente (no-asociadas) en el catálogo general.

***

## Relato 22: Modificar playlist como usuario administrador.
### Historia:
Yo como usuario administrador, quiero poder modificar playlists (agregar, quitar y reordenar canciones; cambiar visibilidad (pública/privada)) creadas por administradores, en bache o 'uno a uno', para generar y actualizar contenido para los usuarios visita o estándares
### Validación:
* Si playlist era pública y pasa a ser privada, sólo administradores pueden verlas.
* Si playlist era privada y pasa a ser pública, todos los usuarios (visitas, administrador, adminsitrador) pueden verla y acceder a ella.
* Si modificación es en bache, todos los cambios se aplican a la lista una vez que el administrador haya terminado de hacer los cambios.
* Si modificación es 'uno a uno', las modificaciones se van aplicando y visualizando en la medida que se hacen.
