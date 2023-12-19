/**
 * O express é um pacotinho com funções prontas criadas
 * por pessoas do bem, para tornar a construção de 
 * servidores com javascript de mais fácil.
 * 
 * Use npm install express para baixa-lo
 * 
 */
const express = require("express")

/**
 * O que essa linha faz? Lembra do require express logo acima ? Então, 
 * aquilo é uma função que executa varias coisinhas, quando você o executa
 * -> express()  <- automaticamente um servidor é criado.
 */
const app = express()

/***
 * 
 * Esse pacotinho também tem uma função, e você precisa fazer o require
 * para poder usar na sua aplicação, conforme abaixo. 
 */
const consign = require("consign")

app.set('view engine', 'ejs')
app.set('views','mvc/views/ctrldev')
app.use(express.static('mvc/views/public'))

/**
 * Você usa isso para trabalhar com json, caso não seja feita essa configuração
 * basicamente você não vai conseguir manipular json vindo de fora. Faz o teste aí.
 * Tira essa configuração e tenta receber um json. Depois me conta.
 */

app.use(express.json())

/**
 * Entenda como a mesma descrita acima, porém com formulários.
 */
app.use(express.urlencoded({extended: true}))

/**
 * Fazendo isso você não vai precisar ficar importando todos os aquivos
 * que você criou nessa página, um por vez.
 * O própio consign vai na pasta controllers localizada dentro da outra pasta
 * mvc e carrega todos os arquivos que estão lá até aqui, sem você precisar fazer 
 * mais nada.
 */
consign()
        .include("mvc/controllers")
        .into(app)


/**
 * Isso serve pra você dizer que seu servidor vai funcionar na porta 3000
 * ou seja, para alguém te encontrar, vai ter que acessar http:seu-ip:3000/,
 * o console.log é só um tchan pra você saber que seu servidor está online
 */
app.listen(3003, () => console.log("Online Server at port 3003"))

/**
 * Use isso para reusar o app em outro arquivo. Lembrando que lá no outro arquivo
 * você vai precisar fazer o const app = require('../trocar-pelo-caminho/startup.js')
 */
module.exports = app