/*

fonction change the   color after choose student inside the table 

*/
const studenttable = document.querySelector(".student-table");
console.log(studenttable);
document.getElementsByClassName;
studenttable.addEventListener("click", (eo) => {
  console.log("here");

  eo.preventDefault();
  eo.target.parentElement.parentElement
    .getElementsByClassName("student active-row")[0]
    .getElementsByClassName("edite")[0]
    .classList.remove("activeedite");
  /*
   *
   */
  eo.target.parentElement.parentElement
    .getElementsByClassName("student active-row")[0]
    .classList.remove("active-row");

  console.log("remove");

  eo.target.parentElement.classList.add("active-row");

  eo.target.parentElement
    .getElementsByClassName("edite")[0]
    .classList.add("activeedite");

  console.log("here btn");
});
