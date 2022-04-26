const writelesson = document.querySelector(".makeposte");
const addlesson = document.querySelector(".btnaddleson");

addlesson.addEventListener("click", (eo) => {
  document.querySelector(".makeposte").style.display = "block";
});

/*
 *
 */
const container = document.querySelector(".contentlesson");
const inputitle = document.querySelector(".titleposte");
const inputcontent = document.querySelector(".Advertise");
const form = document.querySelector("form");

/*
 *
 *
 */

const closebtn = document.querySelector(".btnclosewritelesson");
closebtn.addEventListener("click", (eo) => {
  document.querySelector(".makeposte").style.display = "none";
});
