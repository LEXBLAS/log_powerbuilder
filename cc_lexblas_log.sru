$PBExportHeader$cc_lexblas_log.sru
forward
global type cc_lexblas_log from nonvisualobject
end type
end forward

global type cc_lexblas_log from nonvisualobject
end type
global cc_lexblas_log cc_lexblas_log

type variables
datetime id_fecha
constant string IS_TIPO_ERROR="ERROR: " 
constant string IS_TIPO_INFORMATION="INFORMATION: "
string is_log_directory="logPower"
string is_directory_base="C:/"



end variables
forward prototypes
public subroutine of_log (string arg_mensaje)
public function string of_fullpath_directory ()
public subroutine of_log (string arg_tipo_mensaje, string mensaje)
public subroutine of_log (string mensaje, runtimeerror arg_error)
public subroutine of_log (runtimeerror arg_error)
private function string of_getdetailerror (runtimeerror arg_error)
private subroutine of_check_directory ()
end prototypes

public subroutine of_log (string arg_mensaje);
this.of_log(is_tipo_information,arg_mensaje)
end subroutine

public function string of_fullpath_directory ();
return is_directory_base+"/"+is_log_directory+"/"
end function

public subroutine of_log (string arg_tipo_mensaje, string mensaje);integer li_FileNum
string ls_cadena,ls_nombre_archivo
string fechaHora
this.of_check_directory( )
fechaHora=String(Today(), "yyyy/m/d hh:mm")
ls_nombre_archivo="log_"+String(Today(), "yyyy-m-d")+".log"
ls_nombre_archivo=this.of_fullpath_directory()+ls_nombre_archivo
li_FileNum = FileOpen(ls_nombre_archivo, LineMode!,Write!, Shared!, Append!)
ls_cadena="Fecha hora: "+fechaHora+" - "+arg_tipo_mensaje +" - "+mensaje
FileWrite(li_FileNum, ls_cadena)


FileClose(li_FileNum)
end subroutine

public subroutine of_log (string mensaje, runtimeerror arg_error);
string ls_cadena
ls_cadena=of_getDetailError(arg_error);
this.of_log( is_tipo_error,ls_cadena)
end subroutine

public subroutine of_log (runtimeerror arg_error);
string ls_cadena

ls_cadena=of_getDetailError(arg_error);
this.of_log( is_tipo_error,ls_cadena)
end subroutine

private function string of_getdetailerror (runtimeerror arg_error);string ls_cadena
ls_cadena=" Detail error-> Description "+arg_error.getmessage()+" - "
ls_cadena=ls_cadena+" RoutineName: "+arg_error.RoutineName+"  - Line: "+string(arg_error.line)+" - "
ls_cadena=ls_cadena+" Error Number: "+string(arg_error.number)

return ls_cadena;
end function

private subroutine of_check_directory ();integer li_filenum
string ls_path
ls_path=is_directory_base+"/"+is_log_directory
try
If DirectoryExists ( ls_path )=false Then
	ChangeDirectory( is_directory_base )
	CreateDirectory ( is_log_directory )
End If
//li_filenum = ChangeDirectory( ls_path )
catch(RuntimeError mierror)
messagebox("Error",mierror.getmessage(),stopsign!) 
end Try
end subroutine

on cc_lexblas_log.create
call super::create
TriggerEvent( this, "constructor" )
end on

on cc_lexblas_log.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

