Use Blueprint
--  1) Listado de todos los clientes.
Select RazonSocial From Clientes
--  2) Listado de todos los proyectos.
Select Nombre From Proyectos
--  3) Listado con nombre, descripci�n, costo, fecha de inicio y de fin de todos los proyectos.
Select Nombre, Descripcion, Costo, FechaInicio, FechaFin From Proyectos
--  4) Listado con nombre, descripci�n, costo y fecha de inicio de todos los proyectos con costo mayor a cien mil pesos.
Select Nombre, Descripcion, Costo, FechaInicio, FechaFin From Proyectos  Where Costo > 100000
--  5) Listado con nombre, descripci�n, costo y fecha de inicio de todos los proyectos con costo menor a cincuenta mil pesos .
Select Nombre, Descripcion, Costo, FechaInicio, FechaFin From Proyectos  Where Costo < 50000
--  6) Listado con todos los datos de todos los proyectos que comiencen en el a�o 2020.
Select * From Proyectos Where Year(FechaInicio) = 2020
--  7) Listado con nombre, descripci�n y costo de los proyectos que comiencen en el a�o 2020 y cuesten m�s de cien mil pesos.
Select Nombre, Descripcion, Costo From Proyectos Where Year(FechaInicio) = 2020 AND Costo > 100000
--  8) Listado con nombre del proyecto, costo y a�o de inicio del proyecto.
Select Nombre, Costo, FechaInicio From Proyectos
--  9) Listado con nombre del proyecto, costo, fecha de inicio, fecha de fin y d�as de duraci�n de los proyectos.
Select Nombre, Costo, FechaInicio, FechaFin, DATEDIFF(DAY, FechaInicio, FechaFin) AS 'D�as de duraci�n del proyecto' FROM Proyectos
-- 10) Listado con raz�n social, cuit y tel�fono de todos los clientes cuyo IDTipo sea 1, 3, 5 o 6
Select RazonSocial, Cuit, TelefonoFijo From Clientes Where ID IN (1, 3, 5, 6)
-- 11) Listado con nombre del proyecto, costo, fecha de inicio y fin de todos los proyectos que no pertenezcan a los clientes 1, 5 ni 10.
Select Nombre, Costo, FechaInicio, FechaFin From Proyectos Where IDCliente NOT IN (1, 5, 10)
-- 12) Listado con nombre del proyecto, costo y descripci�n de aquellos proyectos que hayan comenzado entre el 1/1/2018 y el 24/6/2018.
Select Nombre, Costo, Descripcion From Proyectos Where FechaInicio BETWEEN '2018-01-01' AND '2018-06-24'
-- 13) Listado con nombre del proyecto, costo y descripci�n de aquellos proyectos que hayan finalizado entre el 1/1/2019 y el 12/12/2019.
Select Nombre, Costo, Descripcion From Proyectos Where FechaFin BETWEEN '2019-01-01' AND '2019-12-12'
-- 14) Listado con nombre de proyecto y descripci�n de aquellos proyectos que a�n no hayan finalizado.
Select Nombre, Descripcion From Proyectos Where FechaFin IS NULL
-- 15) Listado con nombre de proyecto y descripci�n de aquellos proyectos que a�n no hayan comenzado.
Select Nombre, Descripcion From Proyectos Where FechaInicio IS NULL
-- 16) Listado de clientes cuya raz�n social comience con letra vocal.
Select RazonSocial From Clientes Where RazonSocial LIKE '[AEIOU]%'
-- 17) Listado de clientes cuya raz�n social finalice con vocal.
Select RazonSocial From Clientes Where RazonSocial LIKE '%[AEIOU]'
-- 18) Listado de clientes cuya raz�n social finalice con la palabra 'Inc'
Select RazonSocial From Clientes Where RazonSocial LIKE '%Inc'
-- 19) Listado de clientes cuya raz�n social no finalice con vocal.
Select RazonSocial From Clientes Where RazonSocial NOT LIKE '%[AEIOU]'
-- 20) Listado de clientes cuya raz�n social no contenga espacios.
Select RazonSocial From Clientes Where RazonSocial NOT LIKE '% %'
-- 21) Listado de clientes cuya raz�n social contenga m�s de un espacio.
Select RazonSocial From Clientes Where RazonSocial LIKE '% % %'
Select RazonSocial From Clientes Where RazonSocial LIKE '% % % %'
-- 22) Listado de raz�n social, cuit, email y celular de aquellos clientes que tengan mail pero no tel�fono.
Select RazonSocial, Cuit, Email, TelefonoMovil From Clientes Where Email IS NOT NULL AND TelefonoFijo IS NULL
-- 23) Listado de raz�n social, cuit, email y celular de aquellos clientes que no tengan mail pero s� tel�fono.
Select RazonSocial, Cuit, Email, TelefonoMovil From Clientes Where Email IS NULL AND TelefonoFijo IS NOT NULL
-- 24) Listado de raz�n social, cuit, email, tel�fono o celular de aquellos clientes que tengan mail o tel�fono o celular .
Select RazonSocial, Cuit, Email, TelefonoMovil, TelefonoFijo From Clientes Where Email IS NOT NULL OR TelefonoFijo IS NOT NULL OR TelefonoMovil IS NOT NULL
-- 25) Listado de raz�n social, cuit y mail. Si no dispone de mail debe aparecer el texto "Sin mail".
Select RazonSocial, Cuit, case when Email IS NULL then 'Sin mail' else Email End As 'Email' From Clientes
-- 26) Listado de raz�n social, cuit y una columna llamada Contacto con el mail, si no posee mail, con el n�mero de celular y si no posee n�mero de celular con un texto que diga "Incontactable".
Select RazonSocial, Cuit, case when Email IS NOT NULL then Email when Email IS NULL AND TelefonoMovil IS NOT NULL then TelefonoMovil else 'INCONTACTABLE' End As 'Contacto' From CLIENTES
