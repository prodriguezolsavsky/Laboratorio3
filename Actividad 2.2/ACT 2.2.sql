Use BluePrint


-- 1) Por cada cliente listar raz�n social, cuit y nombre del tipo de cliente.
select CL.RazonSocial, CL.cuit, T.nombre as TipoDeCliente
from Clientes as CL 
inner Join TiposCliente as T ON T.ID = Cl.IDTipo

-- 2)
-- Por cada cliente listar raz�n social, cuit y nombre de la ciudad y nombre del pa�s. S�lo de aquellos
-- clientes que posean ciudad y pa�s.
select CL.razonsocial, CL.cuit, C.nombre as Ciudad, P.nombre as Pais
From Clientes as CL
Inner Join Ciudades as C ON C.ID = CL.IDCiudad
Inner Join Paises as P ON P.ID = C.IDPais

-- 3)
-- Por cada cliente listar raz�n social, cuit y nombre de la ciudad y nombre del pa�s. Listar tambi�n los datos de aquellos clientes
--que no tengan ciudad relacionada.
select CL.razonsocial, CL.cuit, C.nombre as Ciudad, P.nombre as Pais
From Clientes as CL
Left Join Ciudades as C ON C.ID = CL.IDCiudad
Left Join Paises as P ON P.ID = C.IDPais

-- 4)
-- Por cada cliente listar raz�n social, cuit y nombre de la ciudad y nombre del pa�s. Listar tambi�n los datos de aquellas ciudades y pa�ses que no tengan clientes relacionados.
select CL.razonsocial, CL.cuit, C.nombre as Ciudad, P.nombre as Pais
From Clientes as CL
Right Join Ciudades as C ON C.ID = CL.IDCiudad
Right Join Paises as P ON P.ID = C.IDPais

-- 5)
-- Listar los nombres de las ciudades que no tengan clientes asociados. Listar tambi�n el nombre del pa�s al que pertenece la ciudad.
select C.nombre as Ciudad, P.nombre as Pais
From Clientes as CL
Right Join Ciudades as C ON C.ID = CL.IDCiudad
Right Join Paises as P ON P.ID = C.IDPais
Where CL.ID is null

-- 6)
-- Listar para cada proyecto el nombre del proyecto, el costo, la raz�n social del cliente, el nombre del tipo de cliente y 
--el nombre de la ciudad (si la tiene registrada) de aquellos clientes cuyo tipo de cliente sea 'Extranjero' o 'Unicornio'.
select PR.nombre as Proyecto, PR.CostoEstimado, CL.razonsocial, C.nombre as Ciudad
From Proyectos as PR
Inner Join Clientes as CL ON CL.ID = PR.IDCliente
Inner Join Ciudades as C ON C.ID = CL.IDCiudad
Inner Join TiposCliente as T ON T.ID = CL.IDTipo
Where T.Nombre = 'Unicornio' or T.Nombre = 'Extranjero'  

--7
--Listar los nombre de los proyectos de aquellos clientes que sean de los pa�ses 'Argentina' o 'Italia'.
select PR.nombre as Proyecto
From Proyectos as PR
Inner Join Clientes as CL ON CL.ID = PR.IDCliente
Inner Join Ciudades as C ON C.ID = CL.IDCiudad
Inner Join Paises as P ON P.ID = C.IDPais
Where P.Nombre = 'Argentina' or P.Nombre = 'Italia' 
--8
--Listar para cada m�dulo el nombre del m�dulo, el costo estimado del m�dulo, el nombre del proyecto, la descripci�n
--del proyecto y el costo estimado del proyecto de todos aquellos proyectos que hayan finalizado.
select M.nombre as Modulo, M.CostoEstimado, PR.Nombre as Proyecto, PR.Descripcion, PR.CostoEstimado as CostoProyecto
From Modulos as M
Inner Join Proyectos as PR ON M.IDProyecto = PR.ID
Where PR.FechaFin is not null
--9
--Listar los nombres de los m�dulos y el nombre del proyecto de aquellos m�dulos cuyo tiempo estimado de realizaci�n
--sea de m�s de 100 horas.
select M.nombre as Modulo, PR.Nombre as Proyecto
From Modulos as M
Inner Join Proyectos as PR ON M.IDProyecto = PR.ID
Where M.TiempoEstimado>100
--10
--Listar nombres de m�dulos, nombre del proyecto, descripci�n y tiempo estimado de aquellos m�dulos cuya fecha estimada
--de fin sea mayor a la fecha real de fin y el costo estimado del proyecto sea mayor a cien mil.
select M.nombre as Modulo, PR.Nombre as Proyecto, M.Descripcion, M.TiempoEstimado
From Modulos as M
Inner Join Proyectos as PR ON M.IDProyecto = PR.ID
Where M.FechaEstimadaFin>M.FechaFin and PR.CostoEstimado>100000
--11
--Listar nombre de proyectos, sin repetir, que registren m�dulos que hayan finalizado antes que el tiempo estimado.
select DISTINCT PR.nombre as NombreProyecto
From Modulos as M
inner Join Proyectos as PR ON M.IDProyecto = PR.ID
Where M.FechaEstimadaFin>M.FechaFin 
--*12
--Listar nombre de ciudades, sin repetir, que no registren clientes pero s� colaboradores.
select DISTINCT C.nombre as Ciudad
From Ciudades as C
left join Clientes as CL ON CL.IDCiudad=C.ID
inner Join Colaboradores as COL ON COL.IDCiudad=C.ID
Where CL.IDCiudad is null

--13
--Listar el nombre del proyecto y nombre de m�dulos de aquellos m�dulos que contengan la palabra 'login' en su nombre 
--o descripci�n.
select PR.nombre as Proyecto, M.nombre as Modulo
from Proyectos as PR 
inner Join Modulos as M on M.IDProyecto=PR.ID
where M.nombre like '%login%' OR M.Descripcion like '%login%'


--14
--Listar el nombre del proyecto y el nombre y apellido de todos los colaboradores que hayan realizado alg�n tipo de 
--tarea cuyo nombre contenga 'Programaci�n' o 'Testing'. Ordenarlo por nombre de proyecto de manera ascendente.
select PR.nombre as Proyecto, COL.nombre, COL.apellido
from Proyectos as PR
inner join Modulos as M on M.IDProyecto=PR.ID
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on Ti.ID=T.IDTipo
inner Join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner Join Colaboradores as COL on COL.ID=COLA.IDColaborador
where Ti.Nombre like '%Programaci�n%' OR Ti.Nombre like '%Testing%'
ORDER BY PR.Nombre ASC

--*15
--Listar nombre y apellido del colaborador, nombre del m�dulo, nombre del tipo de tarea, precio hora de la colaboraci�n 
--y precio hora base de aquellos colaboradores que hayan cobrado su valor hora de colaboraci�n m�s del 50% del valor
--hora base.
select COL.Nombre, COL.Apellido, M.Nombre as M�dulo, Ti.Nombre as TipoTarea, COLA.PrecioHora as PrecioHoraColab, Ti.PrecioHoraBase
from Modulos as M 
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on Ti.ID=T.IDTipo
inner Join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner Join Colaboradores as COL on COL.ID=COLA.IDColaborador
where COLA.PrecioHora>(1.5*Ti.PrecioHoraBase)
--*16
--Listar nombres y apellidos de las tres colaboraciones de colaboradores externos que m�s hayan demorado en realizar
--alguna tarea cuyo nombre de tipo de tarea contenga 'Testing'.
select TOP 3 COL.Nombre, COL.Apellido, COLA.Tiempo, Ti.Nombre 
from Modulos as M 
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on Ti.ID=T.IDTipo
inner Join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner Join Colaboradores as COL on COL.ID=COLA.IDColaborador
where Ti.Nombre LIKE '%Testing%' and COL.Tipo = 'E'
order by COLA.Tiempo DESC

--*17
--Listar apellido, nombre y mail de los colaboradores argentinos que sean internos y cuyo mail no contenga '.com'.
select COL.Nombre, COL.Apellido, COL.EMail
from Colaboradores as COL 
inner join Ciudades as C on COL.IDCiudad=C.ID
inner join Paises as P on C.IDPais=P.ID
where P.Nombre like '%argentin%' and COL.EMail NOT like '%.com%'

--18
--Listar nombre del proyecto, nombre del m�dulo y tipo de tarea de aquellas tareas realizadas por colaboradores externos.
select PR.nombre as Proyecto, M.nombre as M�dulo, Ti.Nombre as TipoTarea
from Proyectos as PR
inner join Modulos as M on M.IDProyecto=PR.ID
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on Ti.ID=T.IDTipo
inner Join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner Join Colaboradores as COL on COL.ID=COLA.IDColaborador
where COL.Tipo = 'E'
--19
--Listar nombre de proyectos que no hayan registrado tareas.
select DISTINCT PR.nombre as Proyecto
from Proyectos as PR
inner join Modulos as M on M.IDProyecto=PR.ID
full join Tareas as T on T.IDModulo=M.ID
where T.IDModulo is null
--*20
--Listar apellidos y nombres, sin repeticiones, de aquellos colaboradores que hayan trabajado en alg�n proyecto que 
--a�n no haya finalizado.
select DISTINCT COL.Apellido, COL.Nombre
from Proyectos as PR
inner join Modulos as M on M.IDProyecto=PR.ID
inner join Tareas as T on T.IDModulo=M.ID
inner join TiposTarea as Ti on Ti.ID=T.IDTipo
inner Join Colaboraciones as COLA on COLA.IDTarea=T.ID
inner Join Colaboradores as COL on COL.ID=COLA.IDColaborador
where PR.FechaFin is null