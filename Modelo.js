var db;

function openDB(){db = LocalStorage.openDatabaseSync("datos1", "1.0", "descripcion de la base de datos", 100000);}

    openDB();

    function insertar(tabla,arr){ //Funcion insertar
        console.log("INSERTANDO ...")



        openDB();

        db.transaction(function(tx){
            var r = tx.executeSql('SELECT name, sql FROM sqlite_master WHERE type="table" AND name = "'+tabla+'";', [], function (tx, results) { });
        var b = r.rows.item(0).sql.replace(/^[^\(]+\(([^\)]+)\)/g, '$1').split(',')
            for(var i = 0;i<b.length;i++){
                b[i] = b[i].match(/^ \S*/g);  //busca una cadena despues de los espacios
                b[i] = b[i][0].trim()  //remueve espacios en blanco de ambos lados de la cadena
                console.log(b[i])    //imprimir arreglo.
            }
            var insert ='insert into '+tabla+'(';
            for(var i = 1; i<b.length;i++){
                if(i+1 == b.length)  //if para quitar la coma de la ultima posicion
                {
                    insert+=b[i];
                }else{
                    insert+=b[i]+',';
                }
            }
            insert+=')VALUES('
            var cont = 0;
            for(var x in arr){
                cont++;
                if(cont == longitud(arr)){
                    insert+=arr[x]
                }else{
                    insert+=arr[x]+",";
                }
            }
             insert+=');'
            console.log(insert)
        }
        )
        console.log("FIN INSERTAR")
    }
    function longitud(x){
        var cont = 0
        for(var i in x){
            cont++
        }
        return cont;
    }


function actualizar(tabla,arr,id){ //Funcion actualizar datos
    console.log("ACTUALIZANDO ...")
    openDB();
    console.log(tabla)

    db.transaction(function(tx){
        var  r = tx.executeSql('SELECT name, sql FROM sqlite_master WHERE type="table" AND name = "'+tabla+'";', [], function (tx, results) { });
        var b = r.rows.item(0).sql.replace(/^[^\(]+\(([^\)]+)\)/g, '$1').split(',')
        for(var i = 0;i<b.length;i++){
            b[i] = b[i].match(/^ \S*/g); //busca una cadena despues de los espacios
            b[i] = b[i][0].trim() //remueve espacios en blanco de ambos lados de la cadena
            console.log(b[i]) //imprimir arreglo.
        }
        var tmp = []
        var cont = 0
        for(var x in arr){
            tmp[cont] = arr[x].split(',')
            console.log(tmp[cont][0])
            console.log(tmp[cont][1])
            cont++
        }
        //hacer una iteracion de fuerza bruta para comparar el primer campo
        //con todos los de la base de datos
        var insert ='UPDATE '+tabla+'  SET ';
        for(var i = 0; i<b.length;i++){
            if(i+1 == b.length)  //if apra quitar la coma de la ultima posicion
            {
                if(tmp[i][0] == b[i]){  //esta parte no funciona
                    insert+=b[i]+'="'+tmp[i][1]+'"';
                }
            }else{
                if(tmp[i][0] == b[i]){
                insert+=b[i]+'="'+tmp[i][1]+'" ,';
                }
            }
        }
        insert+='WHERE  id = '+id
        console.log(insert)
    }

    )
    console.log("FIN CONSULTA")
}

/////////////////////////////////////////////Borrar/////////////////////////////////////////////////////////////////////////////////////////////

function borrar(tabla, id){
    console.log("ELIMINANDO...")
    var globalId;
    openDB();
    db.transaction(function(tx){
        var  r = tx.executeSql('SELECT name, sql FROM sqlite_master WHERE type="table" AND name = "'+tabla+'";', [], function (tx, results) { });
        var b = r.rows.item(0).sql.replace(/^[^\(]+\(([^\)]+)\)/g, '$1').split(',')
            b[0] = b[0].match(/^ \S*/g); //busca una cadena despues de los espacios
            b[0] = b[0][0].trim() //remueve espacios en blanco de ambos lados de la cadena
            console.log(b[0]) //imprimir arreglo.
            globalId = b[0]
    })

db.transaction(function(tx){
    var r = tx.executeSql("DELETE FROM "+tabla+" Where "+globalId+" = ?",[id]);
    console.log("Terminado ...")
})
}
///////////////////////////////////////Fin borrar/////////////////////////////////////////////////////////////////////////////////////////////

