var db;

function openDB(){db = LocalStorage.openDatabaseSync("datos1", "1.0", "descripcion de la base de datos", 100000);}


function consultarGeneral(tabla){
    var r = ""
    openDB()
    db.transaction( function(tx) {
          var rs = tx.executeSql('SELECT * FROM '+tabla+'');
          return rs;
    })
}


function consultarList(tabla,modelo,nombre){
    openDB()
    db.transaction( function(tx) {
          var rs = tx.executeSql("SELECT * FROM "+tabla+" WHERE nombre like '%"+nombre+"%'");
            for(var i = 0; i < rs.rows.length; i++) {
                model.append({"id":rs.rows.item(i).id,"nombre":rs.rows.item(i).nombre,"aPaterno":rs.rows.item(i).apellido_paterno,"aMaterno":rs.rows.item(i).apellido_materno,"edad":parseInt(rs.rows.item(i).edad),"direccion":rs.rows.item(i).direccion})
            }
    })
}

