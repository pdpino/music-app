e3-explorar_y_reproducir_musica.md


## Relato 1: Reproducir canción.
### Historia: 
Yo como usuario (visita, estándar, administrador) quiero reproducir una cancion que haya previamente seleccionado, para satisfacer mis necesidades musicales.
### Validación:
* Canción puede ser iniciada, parada, pausada.
* Canción puede ser repetida en modo loop.
* Usuario es informado de la canción que está escuchando.


## Relato 2: Reproducir álbum o lista 
### Historia: 
Yo como usuario (visita, estándar, administrador) quiero reproducir un álbum o lista que haya previamente seleccionado, para satisfacer mis necesidades musicales.
### Validación:
* Reproducción puede ser iniciada, parada, pausada.
* Álbum o lista puede ser repetida en modo loop.
* Álbum o lista puede ser reproducido en modo aleatorio.
* Si reproducción es en modo loop y en modo aleatorio, se debe reproducir el álbum entero en modo aleatorio, y para cada nueva repetición, determinar un nuevo orden aleatorio de reproducción
* Usuario es informado de la canción que está escuchando.


## Relato 3: Reproducir artista. 
### Historia: 
Yo como usuario (visita, estándar, administrador) quiero reproducir un álbum o lista que haya previamente seleccionado, para satisfacer mis necesidades musicales.
### Validación
* Reproducción de las canciones del artista puede ser iniciada, parada, pausada.
* Artista puede ser reproducido en modo aleatorio.
* Si reproducción no es en modo aleatorio, el orden de las canciones se determina por cronología de lanzamiento de álbumes/singles.
* Artista puede ser reproducido en modo loop.
* Si reproducción es en modo loop y en modo aleatorio, se debe reproducir el artista entero en modo aleatorio, y para cada nueva repetición, determinar un nuevo orden aleatorio de reproducción
* Usuario es informado de la canción que está escuchando.


## Relato 4: Buscar contenido.
### Historia: 
Yo como usuario (estándar o visita) quiero poder buscar contenido musical (canción, single, álbum, artista, playlist) por nombre, género, año de lanzamiento, o tags, para acceder a éste oportunamente.
### Validación:
Usuario puede buscar y encontrar el contenido asociado, provisto de que exista en el catálogo.


<!-- ## Relato 5: Buscar usuarios.
### Historia: 
Yo como usuario (estándar o visita) quiero poder buscar a otros usuarios estándares (por username, nombre o email) para acceder a sus perfiles y realizar interacciones sociales.
### Validación: 
* Usuario puede buscar y encontrar al usuario en cuestión, provisto de que exista en la db. 
* Usuario no puede ver administradores, incluso cuando los parámetros de búsqueda coincidadn. -->


## Relato 5: Recibir recomendaciones. 
### Historia: 
Yo cómo usuario estándar quiero recibir recomendaciones de canciones que podrían gustarme, para explorar y ampliar mis preferencias. 
### Validación: 
* Usuario puede ver un listado de canciones de similares tendencias a las canciones escuchadas 'normalmente'.


## Relato 6: Acceder al contenido público de mis amigos.
### Historia: 
Yo como usuario estándar, quiero acceder al contenido musical público de mis amigos, de manera fácil y oportuan, para conocer (y eventualmente adquirir) sus tendencias.
### Validación:
* Usuario puede ver y acceder playlists públicas de amigos.