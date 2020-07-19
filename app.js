//NodeJS API
const express = require("express");
const db = require("./config/dbConnector.js");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/api/v1/publicaciones", (req, res) => {
  db.getConnection(function (err, connection) {
    const query = `SELECT * FROM publicaciones 
                        WHERE titulo like '% ${req.query.busqueda} %' OR
                        contenido like '% ${req.query.busqueda} %' OR
                        resumen like '% ${req.query.busqueda} %';`;
    db.query(query, function (err, result, fields) {
      if (err) throw err;
      res.json(result);
    });
    connection.release();
  });
});

app.get("/api/v1/publicaciones/:id", (req, res) => {
  db.getConnection(function (err, connection) {
    const urlId = connection.escape(req.params.id);
    const query = `SELECT * FROM publicaciones WHERE publicacion_id=${urlId};`;
    db.query(query, function (error, result, fields) {
      if (result.length > 0) {
        res.json(result);
      } else {
        res.status(404);
        res.send({ errors: ["No se encuentró la publicación solicitada"] });
      }
    });
    connection.release();
  });
});

app.get("/api/v1/autores", (req, res) => {
  db.getConnection(function (err, connection) {
    const query = `SELECT id, pseudonimo, email FROM autores;`;
    db.query(query, function (err, result, fields) {
      if (err) throw err;
      res.json(result);
    });
    connection.release();
  });
});

app.get("/api/v1/autores/:id", (req, res) => {
  db.getConnection(function (err, connection) {
    const urlId = connection.escape(req.params.id);
    const query = `SELECT id, pseudonimo, email FROM autores WHERE id=${urlId};`;
    connection.query(query, function (error, result, fields) {
      if (result.length > 0) {
        res.json(result);
      } else {
        res.status(404);
        res.send({ errors: ["No se encuentró la publicación solicitada"] });
      }
    });
    connection.release();
  });
});

app.post("/api/v1/autores/", (req, res) => {
  db.getConnection(function (err, connection) {
    const query = `INSERT INTO autores (pseudonimo, email, contrasenia) 
                        VALUES (${connection.escape(req.body.pseudonimo)},
                        ${connection.escape(req.body.email)},
                        ${connection.escape(req.body.contrasenia)});`;
    connection.query(query);

    const queryRespuesta = `SELECT * FROM autores 
                                WHERE pseudonimo=${connection.escape(
                                  req.body.pseudonimo
                                )};`;
    connection.query(queryRespuesta, function (error, result, fields) {
      res.status(201);
      res.json(result);
    });
    connection.release();
  });
});



//?email=<email>&contrasena=<contrasena>
app.post("/api/v1/publicaciones", (req, res) => {
    db.getConnection(function (err, connection) {
        const queryUsuario = `SELECT * FROM autores
                WHERE email=${connection.escape(req.query.email)} AND
                contrasenia= ${connection.escape(req.query.contrasena)};`;
        connection.query(queryUsuario, function (error, result, fields) {
            if (result != undefined) {
                const autorId = result[0].id;
                const queryInsert = `INSERT INTO publicaciones (titulo, contenido, resumen, autor_id) 
                            VALUES (${connection.escape(req.body.titulo)},
                            ${connection.escape(req.body.contenido)},
                            ${connection.escape(req.body.resumen)},
                            ${autorId});`;
                connection.query(queryInsert);

                const queryRespuesta = `SELECT * FROM publicaciones 
                            WHERE titulo=${connection.escape(req.body.titulo)}
                            AND contenido=${connection.escape(req.body.contenido)};`;
                connection.query(queryRespuesta, function (error, result, fields) {
                res.status(201);
                res.json(result);
            });
            } else {
            res.status(400);
            res.send("Error verifique los datos ingresados");
            }
        });
        connection.release();
    });
});

//?email=<email>&contrasena=<contrasena>
app.delete("/api/v1/publicaciones/:id", function (req, res) {
    db.getConnection(function (err, connection) {
        let autor;
        const queryUsuario = `SELECT * FROM autores
                WHERE email=${connection.escape(req.query.email)} AND
                contrasenia= ${connection.escape(req.query.contrasena)};`;
        connection.query(queryUsuario, function (error, result, fields) { 
            autor = result;

            if (autor == undefined){
                res.status(400);
                res.json({"Error":"Credenciales invalidas"});
                return ;
            }

            const queryVerificacion= `SELECT * FROM publicaciones
                                WHERE publicacion_id=${req.params.id}`;
            connection.query(queryVerificacion, (error, result, fields) =>{
                if (result.autor_id != autor[0].id) {
                    res.status(403);
                    res.json({"Error":"Publicacion invalida"})
                }
            })

            const queryDelete = `DELETE FROM publicaciones 
                            WHERE publicacion_id=${req.params.id}
                            AND autor_id=${autor[0].id};`;
            connection.query(queryDelete, (error, result, fields) =>{ 
                console.log(error);
                res.status=200;
                res.json({"DELETE":"Realizado con éxito"});
            });
        });
        connection.release();
    });
});

//Any other page
app.get("/*", (req, res) => {
    res.status(404);
    res.send("Recurso no enctontrado");
});

function verificarLogin (email, pass){
    let user=-1;
    if (email == undefined || pass == undefined){
        return user;
    }
    while (user==-1){

    console.log(user);
    }
    return user;
}

app.listen(port, () => {
    console.log("Servidor escuchando en el puerto: ", port);
});
