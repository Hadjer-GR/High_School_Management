const container = document.querySelector(".contentposte");
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
  const post = ` 
  
  <div class="container id">
                <h2> ${inputitle.value}</h2>
                <p> 
                ${inputcontent.value}
                </p>
                <div class="postimg"></div>
                <br>
                
  `;

  const newpost =
    post +
    `<h5>` +
    dateTime +
    `</h5>
  </div>`;
  container.innerHTML += newpost;
  const thispost = document.getElementsByClassName("container id")[0];
  container.prepend(thispost);
  thispost.classList.remove("id");
  inputitle.value = "";
  inputcontent.value = "";
});
