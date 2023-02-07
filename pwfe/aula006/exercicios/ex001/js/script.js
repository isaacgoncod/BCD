const endereco = document.querySelector("#id-endereco"); //input
const nome = document.querySelector("#id-nome"); //input
const lanche = document.querySelector("#id-lanche option"); //input
const formaPagamento = document.querySelector("#id-pagamento option"); //input
const listaCozinha = document.querySelector("#cozinha");
const listaEntrega = document.querySelector("#entrega");
const card = document.querySelector(".card");

function cadastrar() {
  let clone = card.cloneNode(true);

  clone.classList.remove("model");

  clone.querySelector("#nome").innerHTML = nome.value;
  clone.querySelector("#endereco").innerHTML = endereco.value;
  clone.querySelector("#lanche").innerHTML = lanche.value;
  clone.querySelector("#pagamento").innerHTML = formaPagamento.value;
  clone.querySelector("#data").innerHTML = agora();

  clone.querySelector("button").addEventListener("click", (e) => {
    let elemento = e.target.parentNode;

    elemento.querySelector("#data").innerHTML = agora();

    listaEntrega.appendChild(elemento);

    clone.querySelector("button").innerHTML = "Finalizar";
  });
  listaCozinha.appendChild(clone);

  clone.querySelector("button").addEventListener("dblclick", (e) => {
    e.target.parentNode.remove();
  });
}

function agora() {
  return new Intl.DateTimeFormat("pt-br", {
    dateStyle: "short",
    timeStyle: "short",
  }).format(new Date());
}
