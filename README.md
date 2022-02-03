# App Monthly Challenge 2022
## Proyecto de retos de creación mensual de aplicaciones de la comunidad **[MoureDev](https://moure.dev)** en base a requisitos.

![https://mouredev.com/discord](https://github.com/mouredev/mouredev/blob/master/mouredev_weekly_challenge.png)

También existen repositorios tanto para Kotlin/Android como para Swift/iOS en los que se publicarán semanalmente pequeños retos de código. Así podrás elegir el que mejor se adapta a tus necesidades (o practicar en todos).

[![GitHub Followers](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Kotlin?label=Repositorio%20público%20retos%20Kotlin/Android&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Kotlin)
[![GitHub Followers](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Swift?label=Repositorio%20público%20retos%20Swift/iOS&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Swift)

### El proyecto
La idea principal es utilizar este proyecto para publicar retos de creación de pequeñas Apps y soluciones en diferentes tecnologías (principalmente iOS y Android, aunque si quieres puedes hacerlo via web/desktop). Es una manera para intentar "forzarnos" a practicar desarrollo de aplicaciones en base a requisitos y de forma colaborativa dentro de la comunidad.

## Listado de retos
### Enero: 03/01/22
**CONECTA 4:** Crea el juego conecta cuatro. Tienes un ejemplo parecido [aquí](https://solitariosonline.es/conecta-4). 

Requisitos:

* Tablero de 7x6 (7 en el eje "x" y 6 en el "y").
* Fichas Rojas y Amarillas. La primera partida la comienza siempre la Roja (la segunda la Amarilla, la tercera la Roja...).
* No hay que implementar una funcionalidad que te permita jugar contra la App. Se asume que jugarán dos personas reales alternándose.
* Al seleccionar la columna se coloca la ficha en la parte inferior.
* Guardar el número partidas ganadas de cada equipo mientras la App no se finaliza.
* Dos botones para reiniciar la partida en marcha y para resetear el contador de victorias y derrotas.
* Puedes añadirle todas las funcionalidades extra que consideres.

Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto01.md)

### Febrero: 03/02/22
**LA ENCICLOPEDIA STAR WARS:** Crea una app que sirva para listar los personajes de Star Wars y que te permita buscarlos por nombre.

Requisitos:

* Usa el API [https://swapi.dev/](https://swapi.dev/)
* El diseño es de libre elección.
* Debe mostrar un listado y un detalle de cada personaje.
* El listado tendrá que estar paginado.
* El listado poseerá un filtro de búsqueda.
* Al seleccionar un personaje del listado, el detalle mostrará los datos que consideres oportunos.
* OPCIONAL: Detalle de películas, vehículos, naves, especies...
* OPCIONAL: Foto de cada personaje.

Soluciones: Reto en activo.

### Marzo: 01/03/22
Pendiente de publicación...

### ¿Cómo puedo participar?

**Puedes hacer libremente un fork del proyecto y trabajar con Git para ir sincronizando las actualizaciones del proyecto.**

* Cada primer lunes del mes se publicará un nuevo reto de código.
* Los requisitos del reto mensual se publicarán en este mismo README.
* Se comunicará en el canal `#🗓reto-mensual` de [Discord](https://mouredev.com/discord), en directo desde [Twitch](https://twitch.tv/mouredev) y se subirá el enunciado al [repositorio](https://github.com/mouredev/Monthly-App-Challenge-2022).
* Dispondrás de un mes para resolverlo, preguntar tus dudas, debatir y aportar ayuda en el canal de Discord.
* El primer lunes del mes siguiente (o último del anterior) se subirán enlaces a repositorios de la comunidad con resolucines en diferentes tecnologías, se comentarán en directo desde Twitch **(utilizando resoluciones de entre los asistentes que hayan realizado una `pull request` a mi proyecto con el enlace de GitHub a su proyecto)** y se añadirá el nuevo reto mensual.
* Comenzará de nuevo el proceso.

Si quieres unirte a nuestra comunidad de desarrollo, aprender programación de Apps, mejorar tus habilidades y ayudar a la continuidad del proyecto, puedes encontrarnos en:

[![Twitch](https://img.shields.io/badge/Twitch-Retos_en_directo-9146FF?style=for-the-badge&logo=twitch&logoColor=white&labelColor=101010)](https://twitch.tv/mouredev)
[![Discord](https://img.shields.io/badge/Discord-Canal_de_chat_para_retos-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=101010)](https://mouredev.com/discord)
[![Link](https://img.shields.io/badge/Links_de_interés-moure.dev-39E09B?style=for-the-badge&logo=Linktree&logoColor=white&labelColor=101010)](https://mouredev.com)

### Cómo trabajar con Git y GitHub de forma colaborativa

Deberás realizar flujos de actualización, sincronización y `pull request` desde tu `fork` del proyecto hacia el principal (habitualmente nombrado como `upstream/main`).
Todo esto se puede hacer desde línea de comandos, pero si prefieres puedes usar clientes gráficos como [GitHub Desktop](https://desktop.github.com/) (muy simple) o [GitKraken](https://www.gitkraken.com/invite/cZWhJq1v) (más avanzado y potente).

* Desde tu repo en la propia web de GitHub podrás realizar muchas acciones.
* Resuelve el reto en tu propio repositorio y realiza una `pull request` a mi repositorio con un **"README_#[número del reto].md" (README_#1.md)** que contenga el enlace al repositorio donde has resuelto el reto.
* Desde GitHub, una vez hecho el `fork` verás opciones como "Contribute" o "Fetch upstream":
	* `Contribute` permite abrir una `pull request`(deberás seleccionar el mío como repositorio base contra el que comparar tu proyecto). Así yo podré ver el README con el enlace al tu repo, tal y como comento en el punto anterior. 
	* `Fetch upstream` permite sincronizar tu proyecto con el original en caso de que se haya actualizado.
* Para sincronizar tu proyecto con el original y mantenerlo actualizado también puedes hacer un `merge commit`, `squash merge` o `rebase`(ten en cuenta que cada uno se comporta de una manera, conservando o no tus propios cambios).
* Una vez se publique el nuevo reto, la solución del anterior, y comente las soluciones, cerraré las pasadas `pull request` para dejar paso a las que se hagan para el nuevo reto.

## ![https://mouredev.com](https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_emote.png) Hola, mi nombre es Brais Moure.
### Freelance full-stack iOS & Android engineer

[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCxPD7bsocoAMq8Dj18kmGyQ?style=social)](https://youtube.com/mouredevapps?sub_confirmation=1)
[![Twitch Status](https://img.shields.io/twitch/status/mouredev?style=social)](https://twitch.com/mouredev)
[![Twitter Follow](https://img.shields.io/twitter/follow/mouredev?style=social)](https://twitter.com/mouredev)
![GitHub Followers](https://img.shields.io/github/followers/mouredev?style=social)

Soy ingeniero de software desde hace más de 11 años. Desde hace 3 años combino mi trabajo desarrollando Apps con creación de contenido formativo sobre programación y tecnología en diferentes redes sociales como **[@mouredev](https://moure.dev)**.

### En mi perfil de GitHub tienes más información

[![Web](https://img.shields.io/badge/GitHub-MoureDev-14a1f0?style=for-the-badge&logo=github&logoColor=white&labelColor=101010)](https://github.com/mouredev)