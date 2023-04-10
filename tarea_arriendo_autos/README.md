# Tarea Arriendo de Autos

## Enunciado

Se desea diseñar una base de datos con la información de reservas de una empresa dedicada al arriendo de autos. Se debe considerar
los siguientes aspectos:

Un cliente es un momento determinado puede tener hechas varias reservas. De cada cliente se desea alamacenar su RUT, nombre, direccion y telefono. Los clientes poseen un codigo único de identificación.

Cada cliente puede ser avalado por otro cliente de la empresa. Una reserva la realiza un único cliente, pero puede involucrar varios autos. Se debe registrar la fecha de inicio y termino de la reserva, el precio de arriendo de cada auto, los litros de bencina en el estanque de cada auto al momento de realizar la reserva, el precio total de la reserva y un indicador de que si el auto o los autos han sido entregados.

No se mantendrán datos históricos (antiguos) de reservas. Todo auto tiene asignado un garaje que no puede cambiar. De cada auto se requiere la patente, marca, modelo y color. Cada reserva se realiza en una determinada agencia.
