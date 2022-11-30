# Retos de programación mensuales 2022
## Proyecto de retos de creación mensual de aplicaciones de la comunidad **[MoureDev](https://moure.dev)** en base a requisitos.
### Todos nuestros retos en **[retosdeprogramacion.com/mensuales2022](https://retosdeprogramacion.com/mensuales2022)**

También existen repositorios en los que se publicarán semanalmente pequeños retos de código para mejorar nuestra lógica de programación.

[![GitHub Weekly Kotlin](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Kotlin?label=Retos%20Semanales&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Kotlin)
[![GitHub Weekly Swift](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Swift?label=Retos%20Semanales%20en%20Swift&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Swift)

* Cada mes se presentará un nuevo reto en directo en **[Twitch](https://twitch.tv/mouredev)** y se publicará en **[retosdeprogramacion.com](https://retosdeprogramacion.com/mensuales2022)** y GitHub.
* Lo resolverás tu propio repositorio de GitHub.
* Una vez lo resuelvas, deberás hacer una PULL REQUEST a este repositorio indicando la url de tu repositorio de resolución.
* Pasado el mes del reto, haremos el directo en **[Twitch](https://twitch.tv/mouredev)** revisando los proyectos presentados por la comunidad.
* Tod@s los que resuelvan un reto, participarán en el sorteo de **100€ cada mes en material formativo a tu elección**.


## Vídeo explicación retos

<a href="https://youtu.be/TSMFijaJwpE"><img src="http://i3.ytimg.com/vi/TSMFijaJwpE/maxresdefault.jpg" style="height: 50%; width:50%;"/></a>

### El proyecto
La idea principal es utilizar este proyecto para publicar retos de creación de pequeñas Apps y soluciones en diferentes tecnologías (principalmente iOS y Android, aunque si quieres puedes hacerlo via mediante web). Es una manera para intentar "forzarnos" a practicar desarrollo de aplicaciones en base a requisitos y de forma colaborativa dentro de la comunidad.

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

Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto02.md)

### Marzo: 03/03/22
**CUESTIONARIO CONTRARRELOJ:** Crea una "Quiz app" contrareloj con ranking. 

Requisitos:

* El diseño es de libre elección.
* La temática de las preguntas del cuestionario será de libre elección. Puede estar bien seguir un mismo tema (por ejemplo, preguntas sobre el universo "Harry Potter").
* En la pantalla inicial podrás comenzar a jugar o consultar el ranking de puntuaciones.
* El juego consistirá en 10 preguntas aleatorias con 3 respuestas y sólo una correcta. Recomendable crear más de 10 preguntas para que no siempre salgan las mismas. Cada vez que se responde a una pregunta, se pasará a la siguiente.
* Disponemos de 30 segundos para responder cada pregunta. El contador deberá aparecer en la pantalla, y si llega a 0 se tomará como respuesta incorrecta y se pasará a la siguiente pregunta.
* Al marcar una respuesta o finalizar el tiempo, se mostrará si se ha acertado o no la pregunta, dando feedback sobre cuál sería la respuesta correcta y navegando al cabo de un par de segundos a la siguiente pantalla.
* Sistema de puntuación:
	* Contador a 0 o respuesta incorrecta = 0 puntos.
	* Contador mayor 0 y respuesta correcta = [segundos restantes] puntos. Ej: Si quedaban 9 segundos para finalizar la cuenta atrás y se acierta la pregunta, se asignan 9 puntos.
* Una vez finalizada la pregunta número 10 se mostrará en una nueva pantalla la puntuación final y se deberá introducir un nombre para guardarla de forma persistente (aunque cerremos la app). Hecho estos se mostrará la pantalla de ranking.
* La pantalla de ranking muestra ordenados de mayor a menor los 10 mejores resultados y el nombre guardado. Desde esta pantalla siempre se podrá navegar a la pantalla inicial.

Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto03.md)

### Abril: 31/03/22

> **En primer lugar, ya que en Abril es mi cumpleaños, me gustaría celebrarlo sorteando 100€ en material formativo a tu elección entre todas las Apps presentadas (y funcionales) durante el transcurso del reto 🥳**

**POMODORO:** Crea un "Pomodoro" configurable que guarde todo tu historial de tareas. 

La técnica "pomodoro" es un método para mejorar la administración del tiempo dedicado a una actividad e incrementar tu productividad.

**NOTA:** Si se trata de una App Android o Web, agradecería crear un readme con un enlace de descarga o ejecución de la app. Gracias!

Requisitos:

* Poseerá un campo de texto para introducir el nombre de la tarea que se está llevando a cabo. Cada vez que se cambia la tarea, el pomodoro comienza de cero. Sólo se puede cambiar la tarea si el pomodoro se detiene completamente (en caso contrario no será editable). El pomodoro no puede iniciarse si no se ha definido una tarea.
* Deberá implementar botones para iniciar el pomodoro, pausarlo, pararlo y pasar al siguiente ciclo del pomodoro.
* El pomodoro medirá intervalos formados por 4 bloques de trabajo de 25 minutos con 5 minutos de descanso entre ellos. Cada tres bloques de descanso de 5 minutos, el cuarto bloque será de 15 minutos o 30 minutos (también configurable y guardando la selección de forma persistente).
* Si la aplicación está en segundo plano deberá seguir funcionando. O por lo menos seguir teniendo en cuenta el estado actual del pomodoro.
* Cada vez que acaba un bloque (de trabajo o de descanso) se notificará al usuario con una alerta (si está en primer plano e incluso con sonido) o con una notificación (si está en segundo plano) que ha finalizado ese bloque de tiempo y ha comenzado el siguiente.
* Se guardará un historial agrupado por día con fecha de inicio y fin del bloque/s de trabajo junto con el texto de la tarea realizada. Tiempo total contando descanso y trabajo. Se guarda cada vez que se detiente el pomodoro. El historial puede estar en una patalla individual. Se mostará primero el registro más reciente.
* Esta es un tipo de aplicación con la que podemos practicar diseños de UI más elaborados. Intenta hacerla bonita y con animaciones!

Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto04.md)

### Mayo: 03/05/22

> **[RVIEWER](https://rviewer.io/) se une a los retos mensuales de la comunidad para dar feedback profesional de cada reto y así mejorar nuestras habilidades.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_memorygame.png" style="height: 50%; width:50%;"/></a>

**MEMORY GAME:** Crea un "memograma" o "juego de memoria" basado en parejas de cartas.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga o ejecución de la app. Gracias!

¿Quién no ha jugado alguna vez a las parejas de cartas? Desde bien pequeños hasta alguna noche de fiesta, ¿cierto? Bien, para este reto deberás elegir tu temática favorita y recrear el [famoso juego](https://es.wikipedia.org/wiki/Memoria_(juego)). Sorpréndenos! 😉

**¿En qué consiste el reto?**

*Los requisitos del juego son bastante sencillos. En primer lugar, tienes que elegir la temática que quieras, como Pokémon, Star Wars o incluso Peppa Pig.*

*La dinámica del juego consistirá en presentar un tablero con una serie de cartas boca abajo y revelar todas las parejas antes de que se acabe el tiempo. El usuario tocará cada carta para darle la vuelta y, si dos de ellas coinciden al descubrirlas, se pondrán boca arriba. En caso contrario, se volverán a ocultar.*

*El juego se gana si se descubren todas las parejas dentro del límite de tiempo.*

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://go.rviewer.io/dev-memory-game-es/).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto05.md)

### Junio: 31/05/22

> **[RVIEWER](https://rviewer.io/) apoya los retos mensuales de la comunidad dando feedback profesional de cada reto para así mejorar nuestras habilidades. También, por presentar la prueba durante el mes, entrarás en el sorteo de 100Є en material formativo.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_twitterclone.png" style="height: 50%; width:50%;"/></a>

**CLONANDO TWITTER:** Replica la UI del feed de Twitter en tu propia app.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga o ejecución de la app. Gracias!

El objetivo desde este reto es que seas capaz de replicar la capa visual del feed principal de Tweets en tu propia app. ¿Te animas a clonar la UI de Twitter?

**¿En qué consiste el reto?**

*Puedes clonar la versión web, iOS o Android de Twitter.*

*Cuanto más similar al diseño original, mejor, aunque no es necesario representar todas funcionalidades actuales de Twitter (en las instrucciones completas se indican los requisitos de forma detallada). El objetivo del reto se centra principalmente en tener la capacidad de saber crear UI en base a un diseño ya existente.*

*¡Punto extra! Si quieres desafiarte un poco más, intenta mejorar la aplicación de Twitter.*

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://go.rviewer.io/dev-twitter-mirroring-es/?utm_source=mouredev&utm_medium=github_repo&utm_campaign=twitter_mirroring_mouredev).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto06.md)

### Julio: 28/06/22

> **[RVIEWER](https://rviewer.io/) apoya los retos mensuales de la comunidad dando feedback profesional de cada reto para así mejorar nuestras habilidades. También, por presentar la prueba durante el mes, entrarás en el sorteo de 100Є en material formativo.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_rssreader.png" style="height: 50%; width:50%;"/></a>

**LECTOR RSS:** Crea un agregador de noticias enfocado en un único nicho de mercado.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga, url de la web desplegada o vídeo/capturas con la ejecución de la app. Gracias!

¿Eres capaz de construir el mejor agregador de noticias de un sector?

**¿En qué consiste el reto?**

*Tú decides el nicho que más te guste. Por ejemplo tecnología, desarrollo de software, música, comida, deporte...*

*Crearás una pantalla principal y otras para detalles, marcadores y configuración.*

*¡Punto extra! Aquí mandas tú. Es posible que puedas implementar funcionalidades exclusivas que tengan especial sentido en el nicho que hayas seleccionado... ¡Sorpréndenos!*

#### Fecha de entrega estimada: 29/07/22
De esta manera podrás recibir feedback técnico sobre tu prueba y asistir a su revisión en directo desde Twitch el día de la publicación del próximo reto mensual.

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://bit.ly/39YdJFC).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto07.md)

### Agosto: 02/08/22

> **[RVIEWER](https://rviewer.io/) apoya los retos mensuales de la comunidad dando feedback profesional de cada reto para así mejorar nuestras habilidades. También, por presentar la prueba durante el mes, entrarás en el sorteo de 100Є en material formativo.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_firebasechat.png" style="height: 50%; width:50%;"/></a>

**FIREBASE CHAT:** Crea una aplicación de chat usando Firebase como tu backend.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga, url de la web desplegada o vídeo/capturas con la ejecución de la app. Gracias!

¿Nunca te has preguntado cómo funciona un chat? Pues bien, vamos a crear una aplicación que utilice varios de los servicios de Firebase para login y base de datos en tiempo real.

**¿En qué consiste el reto?**

*La aplicación tendrá una pantalla donde tendrás que hacer login con tu cuenta de Google.*

*Una vez realizado, accederás a una sala de chat donde se visualizarán los mensajes de todos los usuarios y podrás interactuar con ellos.*

*¡Punto extra! ¿Eres capaz de enviar notificaciones push a otro dispositivo cada vez que te escriben? ¿E imágenes?*

#### Fecha de entrega estimada: 27/08/22
De esta manera podrás recibir feedback técnico sobre tu prueba y asistir a su revisión en directo desde Twitch el día de la publicación del próximo reto mensual.

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://bit.ly/3vyk6ap).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto08.md)

### Septiembre: 30/08/22

> **El 13 de Septiembre celebramos el "Día de la Programación". Un día para compartir y pasar en comunidad.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_diadelaprogramacion.png" style="height: 50%; width:50%;"/></a>

**HACKATHON DÍA DE LA PROGRAMACIÓN: Este es un mes muy especial, celebramos el ["Día de la Programación"](https://diadelaprogramacion.com)

#### Fecha de entrega Hackathon: hasta el 11/09/22
Esta es la fecha de entrega límite para poder participar en la hackathon.

#### Fecha de entrega reto mensual: 27/09/22
De esta manera podrás recibir feedback técnico sobre tu prueba y asistir a su revisión en directo desde Twitch el día de la publicación del próximo reto mensual.

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://bit.ly/3AxPhEj).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto09.md)

### Octubre: 29/09/22

> **[RVIEWER](https://rviewer.io/) apoya los retos mensuales de la comunidad dando feedback profesional de cada reto para así mejorar nuestras habilidades. También, por presentar la prueba durante el mes, entrarás en el sorteo de 100Є en material formativo.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_unitconverter.png" style="height: 50%; width:50%;"/></a>

**CONVERSOR DE UNIDADES:** Crea una applicación para encontrar la equivalencia de un valor en diferentes unidades de medida.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga del ejecutable, url de la web desplegada o vídeo/capturas con la ejecución de la app. Gracias!

¿Has probado alguna vez crear tu propio conversor de unidades? Sí, una app con la que puedas transformar unidades de manera instantánea. Peso, temperatura, tiempo, longitud, potencia, monetarias... ¡Y muchísimas más!

**¿En qué consiste el reto?**

*Si tu applicación es capaz de transformar muchos tipos de unidades, debe poseer una pantalla de selección y una de detalle con el conversor.*

*Si decides que tu aplicación únicamente soporte una familia de unidades, puede estar todo en una única pantalla.*

*¡Punto extra! ¿Te atreves a utilizar otro tipo de unidades de medición menos comunes?*

#### Fecha de entrega estimada: 24/08/22
De esta manera podrás recibir feedback técnico sobre tu prueba y asistir a su revisión en directo desde Twitch el día de la publicación del próximo reto mensual.

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://bit.ly/3dQMNcI).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto10.md)

### Noviembre: 26/10/22

> **[RVIEWER](https://rviewer.io/) apoya los retos mensuales de la comunidad dando feedback profesional de cada reto para así mejorar nuestras habilidades. También, por presentar la prueba durante el mes, entrarás en el sorteo de 100Є en material formativo.**

<a href="https://rviewer.io/"><img src="./Rviewer/mouredev_rviewer_pizza.png" style="height: 50%; width:50%;"/></a>

**BUON APPETITO:** Existen ciertos proyectos de software muy habituales. Las tiendas online son uno de ellos. Crea una aplicación que sea capaz de gestionar el pedido en nuestra pizzería perfecta.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme con un enlace de descarga del ejecutable, url de la web desplegada o vídeo/capturas con la ejecución de la app. Gracias!

Pero, ¿por qué es perfecta?
Muy fácil, no tienes que registrarte, una pizza puede estar compuesta hasta por 4 tipos, podrás eliminar ingredientes y conoceremos "un truco" para no tener que pagarlas.

**¿En qué consiste el reto?**

*Al abrir la aplicación se nos presentará el listado de pizzas del restaurante.*

*Podrás consultar el detalle de la pizza para editarla y acceder al carrito de la compra para finalizar el pedido.*

*¡Punto extra! ¿Te atreves a solicitar los datos de envío o a añadir algún método de pago?*

#### Fecha de entrega estimada: 27/11/22
De esta manera podrás recibir feedback técnico sobre tu prueba y asistir a su revisión en directo desde Twitch el día de la publicación del próximo reto mensual.

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://bit.ly/3DdS5HY).
Soluciones: [**ENLACES A LOS REPOSITORIOS**](./SolucionesReto11.md)

### Diciembre: 30/11/22

<a href="https://retosdeprogramacion.com/mensuales2022"><img src="./Images/reto_diciembre_22.jpg" style="height: 50%; width:50%;"/></a>


**LA DEVSTORE:** Un lugar para comprar ropa y complementos para developers... ¿Genialidad o locura?

Crea una web o app que funcione como un sitio donde encontrar aquellos productos que crees que todo developer debería conocer. En este [Tweet](https://twitter.com/MoureDev/status/1597625149838479360?s=20&t=uyXkUz_OX1-54E9ava1ObA) te dejo agunas ideas divertidas aportadas por la comunidad.

**NOTA:** Para la revisión en directo desde Twitch se agradece crear un readme en tu repositorio con un enlace de descarga del ejecutable, url de la web desplegada o vídeo/capturas con la ejecución de la app. Gracias!

**¿En qué consiste el reto?**

*Deberás crear una tienda online pero sin tienda... ¿Cómo? Tu web o app puede servir para enlazar a los productos que venden tiendas online reales (Amazon, por ejemplo) y así utilizar enlaces de referidos que te aporten ingresos.*

*La tienda deberá poseer una sección de productos destacados y diferentes filtros para agrupar por categoría. Los productos son de tu total elección, y cada uno debe tener foto (o más de una) y descripción (e información extra si así lo quieres).*

*¡Punto extra! Es el último reto del año... ¿Quieres formar un equipo de hasta 3 personas (tienen que existir commits de 3 personas) para llevar a cabo el reto? Este es el momento.*

##### Entrega la resolución del reto y participa en el sorteo de 100€ en material formativo (300€ máximo en caso de un equipo de 3 personas)

#### ¿Te animas a resolver este desafío? Aquí tienes [todos los detalles](https://retosdeprogramacion.com/mensuales2022).

### Corrección y nuevo reto: 29/12/22
[🔔 Añadir un recordatorio para asistir al evento en Directo](https://discord.gg/mouredev?event=1047620703437987870)

Pendiente de publicación...

### ¿Cómo puedo participar?

> **Puedes hacer libremente un fork del proyecto y trabajar con Git para compartir mediante una PULL REQUEST la url de resolución de cada reto.**
> 
> **LOS RETOS DE MAYO Y NOVIEMBRE LOS PODRÁS RESOLVER DIRECTAMENTE DESDE [RVIEWER](https://rviewer.io/).**

* Cada mes se publicará un nuevo reto de código.
* Los requisitos o enlace al enunciado del reto mensual se publicarán en este mismo README.
* Se comunicará en el canal `#🗓reto-mensual` de [Discord](https://mouredev.com/discord), en directo desde [Twitch](https://twitch.tv/mouredev) y se subirá el enunciado al [repositorio](https://github.com/mouredev/Monthly-App-Challenge-2022).
* Dispondrás de un mes para resolverlo, preguntar tus dudas, debatir y aportar ayuda en el canal `#🗓reto-mensual` de Discord.
* Al finalizar el mes del reto se subirán enlaces a repositorios de la comunidad con resolucines en diferentes tecnologías, se comentarán en directo desde Twitch **(utilizando resoluciones de entre la gente que haya resuelto el reto)** y se añadirá el nuevo reto mensual.
* Comenzará de nuevo el proceso.

#### Puedes apoyar mi trabajo haciendo "☆ Star" en el repo o nominarme a "GitHub Star". ¡Gracias!

[![GitHub Star](https://img.shields.io/badge/GitHub-Nominar_a_star-yellow?style=for-the-badge&logo=github&logoColor=white&labelColor=101010)](https://stars.github.com/nominate/)

Si quieres unirte a nuestra comunidad de desarrollo, aprender programación de Apps, mejorar tus habilidades y ayudar a la continuidad del proyecto, puedes encontrarnos en:

[![Twitch](https://img.shields.io/badge/Twitch-Retos_en_directo-9146FF?style=for-the-badge&logo=twitch&logoColor=white&labelColor=101010)](https://twitch.tv/mouredev)
[![Discord](https://img.shields.io/badge/Discord-Canal_de_chat_para_retos-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=101010)](https://mouredev.com/discord)
[![Link](https://img.shields.io/badge/Links_de_interés-moure.dev-39E09B?style=for-the-badge&logo=Linktree&logoColor=white&labelColor=101010)](https://mouredev.com)

## ![https://mouredev.com](https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_emote.png) Hola, mi nombre es Brais Moure.
### Freelance full-stack iOS & Android engineer

[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCxPD7bsocoAMq8Dj18kmGyQ?style=social)](https://youtube.com/mouredevapps?sub_confirmation=1)
[![Twitch Status](https://img.shields.io/twitch/status/mouredev?style=social)](https://twitch.com/mouredev)
[![Discord](https://img.shields.io/discord/729672926432985098?style=social&label=Discord&logo=discord)](https://mouredev.com/discord)
[![Twitter Follow](https://img.shields.io/twitter/follow/mouredev?style=social)](https://twitter.com/mouredev)
![GitHub Followers](https://img.shields.io/github/followers/mouredev?style=social)

Soy ingeniero de software desde hace más de 12 años. Desde hace 4 años combino mi trabajo desarrollando Apps con creación de contenido formativo sobre programación y tecnología en diferentes redes sociales como **[@mouredev](https://moure.dev)**.

### En mi perfil de GitHub tienes más información

[![Web](https://img.shields.io/badge/GitHub-MoureDev-14a1f0?style=for-the-badge&logo=github&logoColor=white&labelColor=101010)](https://github.com/mouredev)