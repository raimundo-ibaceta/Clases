####Clase 2, spatial analytics

#---- Part 1: Review  -------------------

#Estas son las cosas que me gustaría que les queden bien claras

### 1. Sintaxis básica

# Creación de Objetos

x<-NULL ### esta línea está creando el objeto null.
y<-c(TRUE,FALSE) ### estoy generando un obejto concatenados con la función c, estos son de formato lógico.
as.numeric(y) ### convierte al obejto en numerico, al true le puse 1 y al false 0.

A<-1 ### creo un obejto numerico
years<-2010:2020
year<-seq(2010,2020, by = 0.5)### crea una secuencia que va de 2010 a 2020 pero de 0.5 en 0.5
tiktoc<-c("Que", "linda", "te ves", "limpiando", "Esperancita",4) ### hacer objetos que tengan textos.aquí me agregará el 4 pero abajo, R lo forzará a que sea con comillas, eso hace la función c.
class(tiktoc)### me da el tipo de objeto que es tiktoc, en este caso es un "character"

numerosentexto <- c("1","2","3")
as.numeric(numerosentexto) ### convierte a los str del objeto numeros en texto en digitos, la respuesta sería 1,2,3.


m1<-matrix(1:4,2,2)### creo la matriz m1, con numeros que van del 1 al 4, de 2 filas y 2 columnas, la matriz es un elemento de 2 dimensiones.
solve(m1) ### me entrega la inversa de m1
diag(m1) ### me entrega la diagonal de m1.
t(m1) ### así calculo la traspuesta de m1.

a1<-array(1:11,dim = c(2,2,3)) ### un objeto que tiene 3 dimensiones (3vectores), filas,columnas y profundidad, que vaya del 1 al 12, si fuese hasta el 11 me repite el 1, dimension de 2 filas, 2 columnas y 3 de profundidad.

d1<-data.frame(m1) ### puedo convertir una matriz a un data frame (permite tener datos numericos, floats con decimales o enteros, textos, de todo.), está creando dps varibales genéricas X1 Y X2 y me está diciendo que tiene 2 observaciones.
data("quakes") # datos en R que viene precargados, promesa de que voy a utilizar estos datos.
d1<-data.frame(quakes) ### ahora esto será un dataframe, d1 toma los mismos valores de quakes.

ls() ### para hacer lista en el fondo.
l1<-list(Numero1=A,years,tiktoc,m1) ### hago listas de lo que sea, el = es para ponerle un nombre a A, me arroja lo que hay en A en vez de que me diga [[1]], years....

# Manipulación de Objetos

ls() ### le pregunto a R que hay en el ambiente (ENVIROMENT)
A<- 1L ### forzar a que sea un entero.

class(A) ### tipo de obejtos que tengo, A =1, es de tipo numerico
typeof(A) ###dice si los elementos dentro el objeto de que tipo son, no es un entero, tiene decimales.

length(years) ### largo de un objeto (years), ojalá con objetos de 1 dimensión.
dim(m1) ### matriz de 2x2. ojalá obejtos 2 dimensiones.
object.size(d1) ### entender cual es el objeto, el tamaño de d1, la memoria del computador.

names(d1) ### nombres de las variables de d1 en este caso, que so  lat, long, etc...
head(d1) ### saber la cabeza de la base de datos, me da las 6 primeras observaciones.
tail(d1) ### me muestra las 6 úlimas observaciones.

rm(A) ### me elimina elementos, me eliminó A de los values en enviroment

#Bonus: como se borra todo?

## rm(list=ls()).

# Indexación uso de los [], sirven para indexar (buscar) un elemento específico dentro de un obejto.

length(years)
years[1] ### posición 1 de years, que es 2010.

dim(m1)
m1
m1[2,3] ### está mal ya que me está tomando por dimensiones, no puedo pedir que me de la 3era columna si solo tiene 2.
m1[1,2] ### dame el elemento de la fila 1 y columna 2, en este caso es "3".
m1[1]### en este caso dame el primero elemento de la matriz.


dim(a1) ### a1 es un array que tiene 3 dimensiones, de 2 filas, 2 columnas y  de profundidad. 
a1[2,1,3] ### fila, columna, profundidad, en la fila deme el 2, en la columna deme el 1 y en la profundidad en el 3.
a1[1,1,3] ### me debiese dar el 9. (LO ENTENDÍ, PERO VOLVER  REVISAR.)

l1
l1[2] ### me va a dar el segundo elemento de la lista, en este caso son los years.
l1[2][[1]][1:2] ### si ya estoy en el 2, quiero que vaya al primer elemento y me dé el rango de 1 hasta 2, en este caso 2010 y 2011.
l1[[2]][1:2]### la misma lógica, quiero que vaya al 2do objeto de la lista y me de los elementos del 1 hasta el 2, en este caso 2010 y 2011.


d1[1,] ### data frames son objetos de 2 dimensiones, 1000 (observaciones)y 5(columnas), quiero la primera de las filas y todas las columnas, si está vacío el 2do espacio quiero todas las columnas.
d1[,1] ### que me de los datos desde atrás hacia el 1, quiero acá todos valores que están en la primera columna "lat" en este caso, como está vacío el 1er espacio quiero todas las filas.
d1$lat[1:4] ### me va a dar los primeros 4 numeros de d1, pero de la variables latitud.
d1$mag ### me dará todos los valores de de la variable mag.
d1[,'lat'] ### me va a dar todos los datos que estén en d1, pero solo de latitud.
d1[1:4,c('lat','long')] ### concatenado los numeros de las variables de las columnas lat y long, me dará las filas del 1 al 4 de las varoiables ñat y long
d1$mag>5 ### me dará las variables de la columna mag que sean mayores a 5 (TRUE OR FALSE.)
table(d1$mag>5) ### conteo de los TRUE Y FALSE, de lo anterior. 
d1[d1$mag>6,] ### primero quiero todas las columnas en que la magnitud del terremoto haya sido mayor que 6.
d1$dummy_5up<-as.numeric(d1$mag>5) ### creo una variable nueva.
head(d1) ### son los primeros 6 datos de las filas y columnas.

# Distinguir entre funciones, objetos, números y sintaxis básica
# Funciones: palabra + () con argumentos separados por commas
# Objetos: palabras a la izquierda del signo <- 


#---- Part 2: Loops  -------------------

A<-2 ### estoy reasignando el valor del objeto A.

if(A==1){ ### las llaves las tengo que abrir y cerrar, sería como utilizar llaves en ves de los 2 puntos.
  print("A es un objeto con un elemento numérico 1")
} else {
  print("A no es igual a 1, pero no se preocupe que lo hacemos")
  A<-1L
} ### estoy testeando si A es igual a 1, en caso de que no sea así, me van a redefinir el objeto A con valor de 1.


for(i in 1:5){ ### el for se encarga de recorrer a i por los valores de 1 a 5.
  print(paste("Me le declaro a la ", i)) ### printeame esto.
  Sys.sleep(2) ### le estoy pidiendo que espere 2 segundos.
  print("no mejor no... fail!") ### despues va a printear mejor no.... fail!
  Sys.sleep(1) ### le estoy pidiendo que espere 1 segundo y vuelve al for a tomar el valor siguiente de i.
}

i<-1
eps<-50/(i^2)
while(eps>0.001){ ### mientras objeto eps sea mayor a 0,001 haga esto:
  eps<-50/(i^2)
  print(paste("eps value es still..", eps))
  i<-i+1
}

#---- Part 3: Data Management ----
# Tres formas de trabajar con datos

### 1. R-Base, usar sus pauetes base
#http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf

quakes[quakes$mag>6,'mag'] ### función que me dará las magnitudes que sean mayores a 6.

by(data = quakes$mag,INDICES = quakes$stations,FUN = mean)### la función by, me dice que para las magnitudes que se encuentren en stations (para todas las estaciones), me saque el promedio.
tapply(X = quakes$mag,INDEX = quakes$stations, FUN = mean)### parecido a lo anterior, solo que lo entrega de otra manera, entrega el promedio por cada vector.
?tapply(vector, index, function)


### 2. tydiverse 
#https://rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
install.packages("tydiverse")
library(tydiverse)
#Cómo se instala el paquete si no lo tengo? Tank!!! ayudaaaa!

### Este comando hace algo similar al de la línea 139.
quakes %>% ### operador py, estoy concatenando acciones que son jerárquicas.
  filter(mag>6) %>% ###filtro al objeto "quakes" para que la magnitud sea mayor que 6.
  select(mag)### y lo vuelvo a filtrar para que me seleccione l magnitud. 

quakes %>% ### comienzo del objeto "quakes"
  group_by(stations) %>% ### le pido que de los valores que se encuentren en estación.
  summarise(mean(mag)) ### me calcule el promedio de las magnitudes por cada estación.


### 3. data.table (recommended in this course)
library(data.table)
install.packages("data.table")
#https://github.com/rstudio/cheatsheets/raw/master/datatable.pdf

quakes<-data.table(quakes)### convierto el objeto quakes a data.table.

quakes[mag>6,.(mag)]### me está dando aquellos datos que tengan magnitudes mayor a 6.

quakes[,mean(mag),by=.(stations)]### pido el promedio de la magnitud por estación.

### Reading data from a file

library(readxl)

casos<-data.table(read_excel("Class_02/2020-03-17-Casos-confirmados.xlsx",na = "—",trim_ws = TRUE,col_names = TRUE),stringsAsFactors = FALSE)

casos<-casos[Región=="Metropolitana",]

library(ggplot2)

ggplot(casos[order(Edad,decreasing = T)],)+geom_bar(stat = 'identity' ,aes(x=`Centro de salud`, y=Edad/Edad, group=Sexo, fill=Edad)) + coord_flip()+ facet_wrap(~Sexo) 

casos[Sexo=="Fememino",Sexo:="Femenino"]

ggplot(casos[order(Edad,decreasing = T),])+geom_bar(stat = 'identity',aes(x=`Centro de salud` ,y=Edad/Edad,fill=Edad)) + coord_flip()+ facet_wrap(~Sexo) +labs(title = "Casos Confirmados por Sexo y Establecimiento",subtitle = "Región Metropolitana - 2020-03-17",caption = "Fuente: https://www.minsal.cl/nuevo-coronavirus-2019-ncov/casos-confirmados-en-chile-covid-19/")

