var db = "";
function openDB(){db = LocalStorage.openDatabaseSync("datos1", "1.0", "descripcion de la base de datos", 100000);}

function crear() {

    openDB();


    db.transaction( function(tx) {
        print('Creando tablas');
        //ACTIVAR LLAVES FORANEAS
        //PRAGMA foreign_keys = ON
        tx.executeSql('PRAGMA foreign_keys = ON');
        console.log('PRAGMA EJECUTADO')
///////////////////////////
//EXPEDIENTE_PACIENTE//////
///////////////////////////

         tx.executeSql('Create table IF NOT EXISTS EXPEDIENTE_PACIENTE ('+
                       ' id_paciente INTEGER PRIMARY KEY AUTOINCREMENT,'+
                       ' foto VARCHAR(100),'+
                       ' apellido_paterno CHAR(30),'+
                       ' apellido_materno CHAR(30),'+
                       ' nombre CHAR(30),'+
                       ' rfc VARCHAR(13),'+
                       ' curp VARCHAR(18),'+
                       ' fecha_nacimiento DATETIME,'+
                       ' edad INTEGER(2),'+
                       ' estatura FLOAT(2,2),'+
                       ' peso FLOAT(2,2),'+
                       ' sexo CHAR(2),'+
                       ' religion CHAR(30),'+
                       ' ocupacion CHAR(30),'+
                       ' estado_civil CHAR(15),'+
                       ' referenciado CHAR(2),'+
                       ' telefono_particular INTEGER(10),'+
                       ' telefono_oficina INTEGER(10),'+
                       ' celular INTEGER(10),'+
                       ' email VARCHAR(50),'+
                       ' calle_y_numero VARCHAR(50),'+
                       ' colonia VARCHAR(30),'+
                       ' ciudad CHAR(30),'+
                       ' estado CHAR(30),'+
                       ' cp INTEGER(5),'+
                       ' pais CHAR(50))');

//////////////////////////
//ENFERMEDAD_TIPO ///////
////////////////////////

        tx.executeSql(' create table IF NOT EXISTS ENFERMEDAD_TIPO('+
                        'id_enfermedad_tipo INTEGER not null primary key AUTOINCREMENT,'+
                        'codigo_enfermedad_tipo VARCHAR(5),'+
                        'nombre_enfermedad_tipo text)');


/////////////////////////////////////////
//FICHA_NOPATOLOGICO_CATALOGOSANGRE//////
/////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_NOPATOLOGICO_CATALOGOSANGRE('+
                     'id_tipo_sangre INTEGER not null primary key  AUTOINCREMENT,'+
                     'tipo_sangre VARCHAR(3))');




///////////////////////////////////
//FICHA_NOPATOLOGICO_ALERGIA//////
/////////////////////////////////
        tx.executeSql('create table IF NOT EXISTS MEDICAMENTO('+
                        'id_medicamento INTEGER not null primary key AUTOINCREMENT,'+
                        'nombre_medicamento VARCHAR(100))');




/////////////////////
//ANALISIS_TIPO/////
///////////////////
        tx.executeSql('create table IF NOT EXISTS ANALISIS_TIPO('+
                        'id_analisis_tipo INTEGER not null primary key AUTOINCREMENT,'+
                        'nombre_analisis_tipo TEXT)');


////////////////////////////////////////////////////////
//FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO////////
//////////////////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO('+
                        'id_catalogo_habito INTEGER not null primary key AUTOINCREMENT,'+
                        'habito VARCHAR(30))');


////////////////////////////////////////////////////
//FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES ////////
//////////////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES('+
                        'id_catalogo_inmunizacion INTEGER not null primary key AUTOINCREMENT,'+
                        'inmunizaciones TEXT)');




///////////////////////////
//CATALOGO_SISTEMA ///////
/////////////////////////
        tx.executeSql('create table IF NOT EXISTS CATALOGO_SISTEMA('+
                        'id_sistema INTEGER not null primary key AUTOINCREMENT,'+
                        'nombre VARCHAR (50))');

//////////////////////////////////////////////////
//FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS////////
////////////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS('+
                        'id_catalogo_padecimiento INTEGER not null primary key AUTOINCREMENT,'+
                        'padecimiento VARCHAR(30))');



/////////////////////////////////////////////SIN DEPENDENCIA //////////////










/////////////////////////////////////////////CON DEPENDENCIA //////////////


/////////////////////////////////////////
//FICHA_NOPATOLOGICO_GRUPOSANGUINEO/////
///////////////////////////////////////
        tx.executeSql('create table IF NOT EXISTS FICHA_NOPATOLOGICO_GRUPOSANGUINEO('+
                        'id_grupo_sanguineo INTEGER  not null primary key AUTOINCREMENT,'+
                        'actividad_deportiva TEXT,'+
                        'viajes  TEXT,'+
                        'id_paciente_fk INTEGER,'+
                        'id_tipo_sangre_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk)'+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN KEY (id_tipo_sangre_fk)'+
                        'REFERENCES FICHA_NOPATOLOGICO_CATALOGOSANGRE(id_tipo_sangre)' +
                        'ON DELETE CASCADE)');


/////////////////////////////////////
//FICHA_NOPATOLOGICO_GRUPO_OTROS////
///////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_NOPATOLOGICO_GRUPO_OTROS('+
                        'id_nopatologico_grupo_otros  INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'id_paciente_fk  INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk)'+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE)');

///////////////////////////////////
//FICHA_NOPATOLOGICO_ALERGIA//////
/////////////////////////////////


        tx.executeSql('create table IF NOT EXISTS FICHA_NOPATOLOGICO_ALERGIA('+
                        'id_nopatologico_alergia  INTEGER not null primary key AUTOINCREMENT,'+
                        'alimento TEXT,'+
                        'medio_ambiente TEXT,'+
                        'otros TEXT,'+
                        'id_paciente_fk  INTEGER,'+
                        'id_medicamento_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN KEY (id_medicamento_fk) '+
                        'REFERENCES MEDICAMENTO(id_medicamento)'+
                        'ON DELETE CASCADE)');




///////////////
//RECETA//////
/////////////

        tx.executeSql('create table IF NOT EXISTS RECETA('+
                        'id_receta INTEGER not null primary key AUTOINCREMENT,'+
                        'presentacion TEXT,'+
                        'cantidad INTEGER(2),'+
                        'medida TEXT,'+
                        'repeticion TEXT,'+
                        'duracion TEXT,'+
                        'id_medicamento_fk INTEGER,'+
                        'FOREIGN KEY (id_medicamento_fk) '+
                        'REFERENCES MEDICAMENTO(id_medicamento)'+
                        'ON DELETE CASCADE)');

//////////////////////////////
//FICHA_HEREDOFAMILIARES/////
////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_HEREDOFAMILIARES('+
                       'id_heredofamiliar INTEGER not null primary key AUTOINCREMENT,'+
                       'enfermedad_padre TEXT,'+
                       'enfermedad_madre TEXT,'+
                       'enfermedad_abuelos_paternos TEXT,'+
                       'enfermedad_abuelos_maternos TEXT,'+
                       'id_paciente_fk INTEGER,'+
                       'FOREIGN KEY (id_paciente_fk) '+
                       'REFERENCES EXPEDIENTE_PACIENTE(id_paciente) '+
                       'ON DELETE CASCADE)');


////////////////////////
//ANALISIS_CLINICO/////
//////////////////////


        tx.executeSql('create table IF NOT EXISTS ANALISIS_CLINICO('+
                        'id_analisis INTEGER not null primary key AUTOINCREMENT,'+
                        'nombre_analisis TEXT,'+
                        'sinonimo TEXT,'+
                        'preparacion TEXT,'+
                        'patologia TEXT,'+
                        'tiempo_entrega DATETIME,'+
                        'costo FLOAT(8),'+
                        'id_analisis_tipo_fk INTEGER,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk)'+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN KEY (id_analisis_tipo_fk)'+
                        'REFERENCES ANALISIS_TIPO(id_analisis_tipo)'+
                        'ON DELETE CASCADE)');


//////////////////////////
//RECETA_TRATAMIENTO/////
////////////////////////

        tx.executeSql('create table IF NOT EXISTS RECETA_TRATAMIENTO('+
                        'id_tratamiento INTEGER not null primary key AUTOINCREMENT,'+
                        'receta_tratamiento TEXT,'+
                        'id_receta_fk INTEGER,'+
                        'FOREIGN KEY (id_receta_fk) '+
                        'REFERENCES RECETA(id_receta)'+
                        'ON DELETE CASCADE)');
////////////////////////////////
//CONSULTA_DESCRIPCION ////////
//////////////////////////////


        tx.executeSql('create table IF NOT EXISTS CONSULTA_DESCRIPCION('+
                        'id_consulta_descripcion INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'fecha DATETIME,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');

//////////////////////////
//TERAPEUTICA////////////
////////////////////////

        tx.executeSql('create table IF NOT EXISTS TERAPEUTICA('+
                        'id_terapeutica INTEGER not null primary key AUTOINCREMENT,'+
                        'plan TEXT,'+
                        'control TEXT,'+
                        'id_tratamiento_fk INTEGER,'+
                        'id_consulta_descripcion_fk INTEGER,'+
                        'FOREIGN KEY (id_tratamiento_fk) '+
                        'REFERENCES RECETA_TRATAMIENTO(id_tratamiento) '+
                        'ON DELETE CASCADE, '+
                        'FOREIGN KEY (id_consulta_descripcion_fk) '+
                        'REFERENCES CONSULTA_DESCRIPCION(id_consulta_descripcion)'+
                        'ON DELETE CASCADE)');

//////////////////////////
//SEGURO_MEDICO//////////
////////////////////////
        tx.executeSql('create table IF NOT EXISTS SEGURO_MEDICO('+
                        'id_seguro_medico INTEGER not null primary key AUTOINCREMENT,'+
                        'institucion_aseguradora TEXT,'+
                        'numero_seguro INTEGER(15),'+
                        'nombre char(30),'+
                        'fecha_expedicion DATETIME,'+
                        'fecha_expiracion DATETIME,'+
                        'nombre_familiar1 char(50),'+
                        'nombre_familiar2 char(50),'+
                        'telefono1 INTEGER(10),'+
                        'telefono2 INTEGER(10),'+
                        'informacion_adicional TEXT,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE)');


//////////////////////////
//MULTIMEDIA/////////////
////////////////////////

        tx.executeSql('create table IF NOT EXISTS MULTIMEDIA('+
                        'fecha_ingreso DATETIME,'+
                        'titulo char(50),'+
                        'descripcion TEXT,'+
                        'imagen VARCHAR(100),'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE)');

//////////////////////////
//LABORATORIO////////////
////////////////////////

        tx.executeSql('create table IF NOT EXISTS LABORATORIO('+
                        'id_laboratorio INTEGER not null primary key AUTOINCREMENT,'+
                        'id_consulta_descripcion_fk INTEGER,'+
                        'id_analisis_fk INTEGER,   '+
                        'FOREIGN key (id_consulta_descripcion_fk) '+
                        'REFERENCES  CONSULTA_DESCRIPCION(id_consulta_descripcion) '+
                        'ON DELETE CASCADE,'+
                        'FOREIGN key (id_analisis_fk) '+
                        'REFERENCES  ANALISIS_CLINICO (id_analisis)'+
                        'ON DELETE CASCADE)');

//////////////////////////
//NOTAS//////////////////
////////////////////////


        tx.executeSql('create table IF NOT EXISTS NOTAS('+
                        'id_nota INTEGER not null primary key AUTOINCREMENT,'+
                        'nota TEXT,'+
                        'observacion TEXT,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE)');

//////////////////////////
//NOTA_EVOLUTIVA/////////
////////////////////////

        tx.executeSql('create table IF NOT EXISTS NOTA_EVOLUTIVA('+
                        'id_nota_evolutiva INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'valor1 INTEGER(3),'+
                        'valor2 INTEGER(3),'+
                        'valor3 INTEGER(3),'+
                        'valor4 INTEGER(3),'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN KEY (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE(id_paciente)'+
                        'ON DELETE CASCADE)');

/////////////////////////////////////////////////////
//FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES/////////
///////////////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_QUIRURGICO_OBSERVACIONES('+
                        'id_observacion INTEGER not null primary key AUTOINCREMENT,'+
                        'observacion  TEXT,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');


////////////////////////////////////////
//FICHA_PATOLOGICO_QUIRURGICO//////////
//////////////////////////////////////


        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_QUIRURGICO('+
                        'id_quirurgico INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'fecha DATETIME,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');


////////////////////////////////////////////
//FICHA_PATOLOGICO_HOSPITALIZACION/////////
//////////////////////////////////////////



        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_HOSPITALIZACION('+
                    'id_hospitalizacion INTEGER not null primary key AUTOINCREMENT,'+
                    'descripcion TEXT,'+
                    'fecha DATETIME,'+
                    'id_paciente_fk INTEGER,'+
                    'FOREIGN key (id_paciente_fk) '+
                    'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                    'ON DELETE CASCADE)');

//////////////////////////////////
//FICHA_PATOLOGICO_TRAUMA////////
////////////////////////////////
        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_TRAUMA( '+
                        'id_trauma INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'fecha DATETIME,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');


///////////////////////////////////////////////
//FICHA_PATOLOGICO_PADECIMIENTO_HABITO////////
/////////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_PADECIMIENTO_HABITO('+
                        'id_habito INTEGER not null primary key AUTOINCREMENT,'+
                        'id_catalogo_habito_fk INTEGER,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk)'+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN key (id_catalogo_habito_fk)'+
                        'REFERENCES FICHA_PATOLOGICO_PADECIMIENTO_CATALOGO_HABITO (id_catalogo_habito)'+
                        'ON DELETE CASCADE)');



////////////////////////////////////////
//FICHA_PATOLOGICO_PADECIMIENTO////////
//////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_PADECIMIENTO('+
                        'id_patologico INTEGER not null primary key AUTOINCREMENT,'+
                        'id_catalogo_padecimiento_fk INTEGER,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN key (id_catalogo_padecimiento_fk) '+
                        'REFERENCES FICHA_PATOLOGICO_CATALOGO_PADECIMIENTOS (id_catalogo_padecimiento)'+
                        'ON DELETE CASCADE)');



////////////////////////////////
//CONSULTA_PADECIMIENTO////////
//////////////////////////////

        tx.executeSql('create table IF NOT EXISTS CONSULTA_PADECIMIENTO('+
                        'id_consulta_padecimiento INTEGER not null primary key AUTOINCREMENT,'+
                        'padecimiento TEXT,'+
                        'medicamento TEXT,'+
                        'fecha DATETIME,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk)'+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');





///////////////////////////////////////////
//FICHA_PATOLOGICO_INMUNIZACIONES ////////
/////////////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS FICHA_PATOLOGICO_INMUNIZACIONES('+
                        'id_patologico_inmunizacion INTEGER not null primary key AUTOINCREMENT,'+
                        'id_catalogo_inmunizacion_fk INTEGER, '+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN key (id_catalogo_inmunizacion_fk )'+
                        'REFERENCES FICHA_PATOLOGICO_CATALOGO_INMUNIZACIONES (id_catalogo_inmunizacion)'+
                        'ON DELETE CASCADE)');




///////////////////////
//DIAGNOSTICO ////////
/////////////////////
        tx.executeSql('create table IF NOT EXISTS DIAGNOSTICO('+
                        'id_diagnostico INTEGER not null primary key AUTOINCREMENT,'+
                        'diagnostico TEXT,'+
                        'id_consulta_descripcion_fk INTEGER,'+
                        'FOREIGN key (id_consulta_descripcion_fk) '+
                        'REFERENCES CONSULTA_DESCRIPCION (id_consulta_descripcion)'+
                        'ON DELETE CASCADE)');
//////////////////////////////////////
//CATALOGO_SISTEMA_SUBSECCION ///////
////////////////////////////////////
        tx.executeSql('create table IF NOT EXISTS CATALOGO_SISTEMA_SUBSECCION('+
                        'id_sistema_subseccion INTEGER not null primary key AUTOINCREMENT,'+
                        'nombre VARCHAR(50),'+
                        'id_sistema_fk INTEGER,'+
                        'foreign key (id_sistema_fk)        '+
                        'REFERENCES CATALOGO_SISTEMA(id_sistema)'+
                        'ON DELETE CASCADE)');

////////////////////////////////////
//CONSULTAS_INTERROGATORIO ////////
//////////////////////////////////

        tx.executeSql('create table IF NOT EXISTS CONSULTAS_INTERROGATORIO('+
                        'id_interrogatorio INTEGER not null primary key AUTOINCREMENT,'+
                        'descripcion TEXT,'+
                        'id_consulta_descripcion_fk INTEGER,'+
                        'id_sistema_subseccion_fk INTEGER,'+
                        'FOREIGN key (id_consulta_descripcion_fk)'+
                        'REFERENCES CONSULTA_DESCRIPCION (id_consulta_descripcion)'+
                        'ON DELETE CASCADE,'+
                        'FOREIGN key (id_sistema_subseccion_fk) '+
                        'REFERENCES CATALOGO_SISTEMA_SUBSECCION(id_sistema_subseccion)'+
                        'ON DELETE CASCADE)');


//////////////////////////////
//NOTA_INTERCONSULTA ////////
////////////////////////////

        tx.executeSql('create table IF NOT EXISTS NOTA_INTERCONSULTA('+
                           'id_nota_interconsulta INTEGER not null primary key AUTOINCREMENT,'+
                           'criterio_diagnostico TEXT,'+
                           'plan_estudios TEXT,'+
                           'sugerencia_diagnostico TEXT,'+
                           'sugerencia_tratamiento TEXT,'+
                           'id_consulta_descripcion_fk INTEGER,'+
                           'FOREIGN key (id_consulta_descripcion_fk)'+
                           'REFERENCES CONSULTA_DESCRIPCION(id_consulta_descripcion)'+
                           'ON DELETE CASCADE)');

////////////////////
//TRASLADO ////////
//////////////////

        tx.executeSql('create table IF NOT EXISTS TRASLADO('+
                       'id_traslado INTEGER not null primary key AUTOINCREMENT,'+
                       'envia VARCHAR(30),'+
                       'recibe VARCHAR(30),'+
                       'motivo VARCHAR(30),'+
                       'impresion_diagnostica TEXT,'+
                       'terapeutica_empleada TEXT,'+
                       'id_consulta_descripcion_fk INTEGER,'+
                       'FOREIGN key (id_consulta_descripcion_fk) '+
                       'REFERENCES CONSULTA_DESCRIPCION(id_consulta_descripcion)'+
                       'ON DELETE CASCADE)');







/////////////////////
//ENFERMEDAD ///////
///////////////////
        tx.executeSql('create table IF NOT EXISTS ENFERMEDAD('+
                        'id_enfermedad INTEGER not null primary key AUTOINCREMENT,'+
                        'codigo_enfermedad_tipo VARCHAR(5),'+
                        'nombre text,'+
                        'id_enfermedad_tipo_fk INTEGER,'+
                        'FOREIGN key (id_enfermedad_tipo_fk)'+
                        'REFERENCES ENFERMEDAD_TIPO(id_enfermedad_tipo)'+
                        'ON DELETE CASCADE)');


//////////////////////////
//PACIENTE_GINECO ///////
////////////////////////

        tx.executeSql('  create table IF NOT EXISTS PACIENTE_GINECO('+
                        'id_gineco INTEGER not null primary key AUTOINCREMENT,'+
                        'menarquia DATETIME,'+
                        'ciclo_menstrual INTEGER(2),'+
                        'flujo_menstrual char(10),'+
                        'actividad_sexual char(2),'+
                        'fecha_primera_relacion DATETIME,'+
                        'no_compañeros INTEGER(1),'+
                        'gestas INTEGER(1),'+
                        'abortos INTEGER(1),'+
                        'fecha_1er_embarazo DATETIME,'+
                        'fecha_ultimo_embarazo DATETIME,'+
                        'partos INTEGER(1),'+
                        'prematuros INTEGER(1),'+
                        'euticos INTEGER(1),'+
                        'distocicos INTEGER(1),'+
                        'vaginales INTEGER(1),'+
                        'abdominales INTEGER(1),'+
                        'postermino INTEGER(1),'+
                        'complicaciones TEXT,'+
                        'cauterizaciones TEXT,'+
                        'menospaucia TEXT,'+
                        'id_paciente_fk INTEGER,'+
                        'FOREIGN key (id_paciente_fk) '+
                        'REFERENCES EXPEDIENTE_PACIENTE (id_paciente)'+
                        'ON DELETE CASCADE)');


        tx.executeSql(' create table IF NOT EXISTS EXPLORACION('+
                        'id_exploracion INTEGER not null primary key AUTOINCREMENT,'+
                        'temperatura FLOAT(2,2),'+
                        'pulso INTEGER(3),'+
                        'tension_arterial INTEGER(3),'+
                        'frec_cardiaca INTEGER(3),'+
                        'frec_respiratoria INTEGER(2),'+
                        'estatura FLOAT(2,2),'+
                        'kg_grasa FLOAT(2,2),'+
                        'porcentaje_magra FLOAT(2,2),'+
                        'kilogramos_magra FLOAT(2,2),'+
                        'porcentaje_agua FLOAT(2,2),'+
                        'kilogramos_agua FLOAT(2,2),'+
                        'id_consulta_descripcion_fk INTEGER,'+
                        'FOREIGN key (id_consulta_descripcion_fk)'+
                        'REFERENCES CONSULTA_DESCRIPCION (id_consulta_descripcion)'+
                        'ON DELETE CASCADE)');


print("Creacion de tablas finalizada");

            });// fin transaccion
}//fin funcion crear
