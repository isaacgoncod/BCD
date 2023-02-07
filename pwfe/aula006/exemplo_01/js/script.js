const data = [
  {
    titulo: "Título 2",
    texto: "texto 012",
  },
  {
    titulo: "Título 3",
    texto: "texto 123",
  },
  {
    titulo: "Título 4",
    texto: "texto 456",
  },
  {
    titulo: "Título 5",
    texto: "texto 789",
  },
];

const body = document.querySelector("body");
const card = document.querySelector(".card");

for (let i = 0; i < data.length; i++) {
  var clone = card.cloneNode(true);

  clone.classList.remove("model");

  clone.querySelector("h3").innerHTML = data[i].titulo;
  clone.querySelector("p").innerHTML = data[i].texto;

  clone.querySelector("button").addEventListener("click", (e) => {
    console.log(e.target.parentNode);
    // let info = document.createElement("p");
    // info.innerHTML = "Algum Texto";
    // e.target.parentNode.appendChild(info);
  });

  body.appendChild(clone);
}

card.remove();
