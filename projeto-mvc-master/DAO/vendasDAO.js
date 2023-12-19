const Venda = require("../mvc/models/vendasModel");
const Database = require("../repository/database");

class VendaDAO {
    #conexao;

    constructor() {
        this.#conexao = new Database();
    }

    async consultarVendas() {
        const listaVendas = [];
        const vendas = await this.#conexao.selecionarVendas();

        if (vendas) {
            for (const venda of vendas) {
                const objVenda = new Venda();

                objVenda.id = venda.id_venda;
                objVenda.hora = venda.hora_venda;
                objVenda.dia = new Date(venda.dia_venda).toLocaleDateString();

                listaVendas.push(objVenda.toJson());
            }
        }

        return listaVendas;
    }

    async consultarVendaId(id) {
        const venda = await this.#conexao.selecionarVendasId(id);

        const objVenda = new Venda();

        objVenda.id = venda[0].id_venda;
        objVenda.hora = venda[0].hora_venda;
        objVenda.dia = venda[0].dia_venda;

        return objVenda.toJson();
    }
    async registrarVenda(hora, dia) {
        const venda = new Venda();
        venda.hora = hora;
        venda.dia = dia;
        await this.#conexao.insertVenda(venda.dia, venda.hora);
    }

    async atualizarVenda(id, dia, hora) {
        const venda = new Venda();
        venda.id = id;
        venda.hora = hora;
        venda.dia = dia;
        const resultado = await this.#conexao.updateVenda(venda.hora, venda.dia, venda.id);
        return resultado;
    }


    async apagarVenda(id) {
        const resultado = await this.#conexao.deleteVenda(id);
        return resultado;
    }
}

module.exports = VendaDAO;
