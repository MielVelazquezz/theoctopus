const path = require('path')


module.exports = (app) => {
app.get("/home", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/principal.html'));
});
app.get("/sobre", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/sobre.html'));
});
app.get("/politica", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/politica-privacidade.html'));
});
// app.get("/index", (req, res) => {
//     res.setHeader("Access-Control-Allow-Origin","*")

//     res.sendFile(path.resolve('mvc/views/public/index.html'));
// });
app.get("/equipe", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/equipe_de_desenvolvimento.html'));
});
app.get("/contato", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/contato.html'));
});
app.get("/Pindex", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/produtos/index.html'));

});
app.get("/detalhes", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/produtos/productDetail.html'));

});
app.get("/produtos", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/produtos/produtos.html'));

});
app.get("/logincadastro", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/senha/logincadastro.html'));

});
app.get("/recuperarsenha", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/senha/recuperarsenha.html'));

});
app.get("/redefinirsenha", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin","*")

    res.sendFile(path.resolve('mvc/views/public/senha/redefinirsenha.html'));

});
}


