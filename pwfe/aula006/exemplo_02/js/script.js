const tarefa = document.querySelector("#tarefa"); //input
const listaPendentes = document.querySelector("#pendentes");
const listaFinalizadas = document.querySelector("#finalizadas");
const card = document.querySelector(".card");

function cadastrar() {
  let clone = card.cloneNode(true);

  clone.classList.remove("model");

  clone.querySelector("#item").innerHTML = tarefa.value;
  clone.querySelector("#data").innerHTML = agora();

  clone.querySelector("button").addEventListener("click", (e) => {
    let elemento = e.target.parentNode;

    e.target.remove();

    elemento.querySelector("#data").innerHTML = agora();

    listaFinalizadas.appendChild(elemento);
  });

  listaPendentes.appendChild(clone);
}

function agora() {
  return new Intl.DateTimeFormat("pt-br", {
    dateStyle: "short",
    timeStyle: "short",
  }).format(new Date());
}
