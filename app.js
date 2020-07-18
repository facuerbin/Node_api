//NodeJS API
const express = require ("express");

const app = express();
const port = 3000;

//Static files to be used
//app.use(express.static('public'));

//Landing page
app.get("/", (req, res) => {
    res.send('Got a GET request')
});

app.post('/', (req, res) => {
    res.send('Got a POST request')
});

app.delete('/user', function (req, res) {
    res.send('Got a DELETE request at /user')
});

//Any other page
app.get("/*", (req,res) =>{
	res.send('Page not found')
});

app.listen(port, () => {
    console.log("Servidor escuchando en el puerto: ", port);
});
