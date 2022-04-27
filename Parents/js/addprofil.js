//    deseign for mobile screen Add Profil
/*
 *
 * deseign View the SideBar
 *
 *
 */

const menu = document.querySelector(".togglemenu");
const deletemenu = document.querySelector(".togglemenu2");

const sidbarmobile = document.querySelector("nav");
menu.addEventListener("click", (eo) => {
  if (sidebar.className == "sidebar close") {
    sidebar.classList.add("close2");
  } else if (sidebar.className == "sidebar close close2") {
    sidebar.classList.remove("close2");
  }
});
deletemenu.addEventListener("click", (eo) => {
  sidebar.classList.remove("close2");
});
