const addlesson = document.querySelector(".btnaddleson");
console.log(addlesson);
const writelesson = document.querySelector(".makeposte");
console.log(writelesson);
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

var today = new Date();
var date =
  today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
var time =
  today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
var dateTime = date + " " + time;
/*
 *
 *
 */
form.addEventListener("submit", (eo) => {
  // this prevent refresh the page
  eo.preventDefault();
  const newlesson =
    `<div class="lesson id">
  <span>` +
    dateTime +
    `</span>`;
  const post = ` 
                        <h3> ${inputitle.value}</h3>
                        <p>
                        ${inputcontent.value}
                        </p>
                        <div>
                            <a href="#"> <i class='bx bx-edit'></i></a>
                            <a href="#"><i class='bx bx-trash'></i></a>
                        </div>
                    </div>
                
  `;

  const newpost = newlesson + post;
  container.innerHTML += newpost;
  const thispost = document.getElementsByClassName("lesson id")[0];
  container.prepend(thispost);
  thispost.classList.remove("id");
  inputitle.value = "";
  inputcontent.value = "";
  document.querySelector(".makeposte").style.display = "none";
});
