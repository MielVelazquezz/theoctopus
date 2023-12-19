class Venda {

    #id
    #dia
    #hora

    
    get id() {
        return this.#id;
    }

    set id(value) {
        this.#id = value;
    }

    get dia() {
        return this.#dia;
    }

    set dia(valor) {
        this.#dia = valor;
    }

    get hora() {
        return this.#hora;
    }

    set hora(valor) {
        this.#hora = valor;
    }

    constructor(dia, hora) {
        this.#dia = dia;
        this.#hora = hora;
    }

    toJson(){
        return {
            "id": this.#id,
            "dia_venda": this.#dia,
            "hora_venda": this.#hora

        }
    }
}

module.exports = Venda;
