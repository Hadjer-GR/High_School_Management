const body = document.querySelector("body"),
  sidebar = document.querySelector("nav"),
  toggle = document.querySelector(".toggle");
searchBtn = document.querySelector(".search-box");
modeSwitch = document.querySelector(".toggle-switch");
modeText = document.querySelector(".mode-text");

toggle.addEventListener("click", () => {
  console.log("here");
  if (sidebar.className == "sidebar close") {
    console.log("here now");

    sidebar.classList.remove("close");
  } else if (sidebar.className == "sidebar") {
    sidebar.classList.add("close");
    console.log("here next");
  }
});

searchBtn.addEventListener("click", () => {
  sidebar.classList.remove("close");
});

modeSwitch.addEventListener("click", () => {
  body.classList.toggle("dark");

  if (body.classList.contains("dark")) {
    modeText.innerText = "Light mode";
  } else {
    modeText.innerText = "Dark mode";
  }
});
/*
 *
 *
 **
 */

/*
 *
 *
 *
 *
 *
 */
