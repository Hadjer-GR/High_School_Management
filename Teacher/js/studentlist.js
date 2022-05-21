const rTable = document.getElementById("studentList");
console.log(rTable);

rTable.addEventListener("click", (eo) => {
  switch (eo.target.parentElement.className) {
    case "rTableRow":
      eo.target.parentElement.parentElement.parentElement
        .getElementsByClassName("rTableRow activeedite")[0]
        .classList.remove("activeedite");
      eo.target.parentElement.classList.add("activeedite");

      break;

    default:
      break;
  }
});
