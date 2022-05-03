# Soluciones Reto 4
## POMODORO
### Publicado el 31/03/22

Crea un "Pomodoro" configurable que guarde todo tu historial de tareas. 

*La técnica "pomodoro" es un método para mejorar la administración del tiempo dedicado a una actividad e incrementar tu productividad.*

Requisitos:

* Poseerá un campo de texto para introducir el nombre de la tarea que se está llevando a cabo. Cada vez que se cambia la tarea, el pomodoro comienza de cero. Sólo se puede cambiar la tarea si el pomodoro se detiene completamente (en caso contrario no será editable). El pomodoro no puede iniciarse si no se ha definido una tarea.
* Deberá implementar botones para iniciar el pomodoro, pausarlo, pararlo y pasar al siguiente ciclo del pomodoro.
* El pomodoro medirá intervalos formados por 4 bloques de trabajo de 25 minutos con 5 minutos de descanso entre ellos. Cada tres bloques de descanso de 5 minutos, el cuarto bloque será de 15 minutos o 30 minutos (también configurable y guardando la selección de forma persistente).
* Si la aplicación está en segundo plano deberá seguir funcionando. O por lo menos seguir teniendo en cuenta el estado actual del pomodoro.
* Cada vez que acaba un bloque (de trabajo o de descanso) se notificará al usuario con una alerta (si está en primer plano e incluso con sonido) o con una notificación (si está en segundo plano) que ha finalizado ese bloque de tiempo y ha comenzado el siguiente.
* Se guardará un historial agrupado por día con fecha de inicio y fin del bloque/s de trabajo junto con el texto de la tarea realizada. Tiempo total contando descanso y trabajo. Se guarda cada vez que se detiente el pomodoro. El historial puede estar en una patalla individual. Se mostará primero el registro más reciente.
* Esta es un tipo de aplicación con la que podemos practicar diseños de UI más elaborados. Intenta hacerla bonita y con animaciones!

Soluciones:

Estos son los enlaces a diferentes repositorios de miembros de la comunidad que han aportado soluciones al reto.

iOS Swift SwiftUI

* [https://github.com/Jose-Develaw/NeumorphicPomodoro](https://github.com/Jose-Develaw/NeumorphicPomodoro)

Android Kotlin View

* [https://github.com/asfroggen/Monthly-App-Challenge-2022/tree/pomodoro](https://github.com/asfroggen/Monthly-App-Challenge-2022/tree/pomodoro)
* [https://github.com/yatusaetec2004/Timerdore/tree/master](https://github.com/yatusaetec2004/Timerdore/tree/master)
* [https://github.com/Tin68/Pomodoro](https://github.com/Tin68/Pomodoro)
* [https://github.com/arieldipietro/PomodoroTechnique](https://github.com/arieldipietro/PomodoroTechnique)
* [https://github.com/webserveis/pomodoty](https://github.com/webserveis/pomodoty)

Angular

* [https://github.com/gmorte/Pomodorok](https://github.com/gmorte/Pomodorok)
* [https://github.com/Sergitxin22/pomodoro-app](https://github.com/Sergitxin22/pomodoro-app)


[**CONSULTA TODOS LOS RETOS**](./README.md)