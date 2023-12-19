const path = require('path');
const VendaDAO = require('../../DAO/vendasDAO'); 
const CupomDAO = require('../../DAO/cupomDAO');

module.exports = (app) => {   

    app.get("/venda", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin", "*");

        const cupom = new CupomDAO();
        
        try {
            let lista_cupoms = await cupom.consultarCupons();
            console.log(lista_cupoms);

            res.render('venda/addvenda', { cupoms: lista_cupoms });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.get("/venda/lista", async (req, res) => {
        res.setHeader("Access-Control-Allow-Origin", "*");

        const vendaDAO = new VendaDAO();

        try {
            const lista_vendas = await vendaDAO.consultarVendas();
            res.render("venda/listvenda", { vendas: lista_vendas });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.get("/vendas", async (req, res) => {
        const vendaDAO = new VendaDAO();
        res.setHeader("Access-Control-Allow-Origin", "*");

        try {
            const lista_vendas = await vendaDAO.consultarVendas();
            res.status(200).json(lista_vendas);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.post("/registrarvenda", async (req, res) => {
        const vendaDAO = new VendaDAO();
        res.setHeader("Access-Control-Allow-Origin", "*");

        try {
            const { horavenda, diavenda } = req.body;
            await vendaDAO.registrarVenda(horavenda, diavenda);

            res.status(201).json({ msg: "ok" });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.get("/venda/alterar/:id", async (req, res) => {
        const vendaDAO = new VendaDAO();
    
        try {
            const dtvenda = await vendaDAO.consultarVendaId(req.params.id);
    
            // Inclua a variável cupoms no objeto que você passa para o método res.render()
            const cupom = new CupomDAO();
            const lista_cupoms = await cupom.consultarCupons();
            
            res.render("venda/upvenda", { venda: dtvenda, cupoms: lista_cupoms });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.put("/venda/alterar", async (req, res) => {
        const vendaDAO = new VendaDAO();
        res.setHeader("Access-Control-Allow-Origin", "*");

        try {
            // Destructuring
            const { id, hora, data } = req.body;

            // Ajuste para garantir que a data esteja no formato apropriado
            const dataFormatada = data ? new Date(data).toISOString().split('T')[0] : null;

            const r = await vendaDAO.atualizarVenda(id, dataFormatada, hora);

            res.status(200).json({ r });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }

        const cupom = new CupomDAO();
        
        try {
            let lista_cupoms = await cupom.consultarCupons();
            console.log(lista_cupoms);

            res.render('venda/addvenda', { cupoms: lista_cupoms });
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });

    app.delete("/venda/apagar/:id", async (req, res) => {
        const vendaDAO = new VendaDAO();
        res.setHeader("Access-Control-Allow-Origin", "*");

        try {
            const result = await vendaDAO.apagarVenda(req.params.id);
            res.status(200).json(result);
        } catch (error) {
            console.error(error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    });
};
