Primero es necesario instalar Erlang y RabbitMQ, así como añadir las variables de entorno de ambos promgramas.

A continuación, necesitaremos instalar una librería, utilizando el siguiente comando:
npm install amqplib

Cuando esté, es posible que haga falta ejecutar este comando para que se inicie el programa
rabbitmqctl.bat start_app

Para ver su funcionamiento, primero ejecutar read.js y después publish.js, cada uno en una consola diferente. Al volver a la consola de read.js, aparecerá el mensaje. Para que deje de escuchar, será necesario pulsar CTRL+C.