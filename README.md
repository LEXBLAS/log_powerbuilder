# cc_lexblas_log PowerBuilder 11.5
La clase cc_lexblas_log permite crear un archivo Log desde Powerbuilder.
Funciones
---------------
* of_log(runtimeerror)
  * Recibe como parametro un objeto runtimeerror y escribe en el archivo log el detalle del error.
 * of_log(string)
  * Recibe un string que es escrito en el archivo log.
 * of_log(string,string)
   *  Recibe dos string que es escrito en el archivo log.
   *  El primero es el tipo de mensaje que puede ser IS_TIPO_ERROR o IS_TIPO_INFORMATION. También pueden pasarle un tipo personalizado.
   *  El segundo es la descripción o mensaje a escribir en el log.
* of_log(string runtimeerror)
  * Recibe como parametro un string y un objeto runtimeerror.El primero es el tipo de mensaje y el segundo el objeto error para escribir el detalle del error.
## Configuración
Se ha creado un archivo logger.ini para indicar la carpeta base en donde se creara la carpeta logger, en donde se van a almacenar los archivos .log

Archivo logger.ini :
 [LOGGER]  
 DIRECTORIO_BASE=c:/test/

--------------------------------

 ## Instancia
 Se puede crear la instancia en el evento open de la aplicación y declarar el objeto como una variable global.  
gc_log=create cc_lexblas_log
Se indica el en donde estaran los archivos log. Si no existe el directorio será creado.  
gc_log.is_log_directory="logger"

## Destruyendo la instancia
En el evento close de la aplicación destruimos la instancia del objeto.
destroy gc_log

## Archivo cc_lexblas_log.sru
Si trabaja con una versión distinta a 11.5 puede importar el objeto usando el archivo cc_lexblas_log.sru
