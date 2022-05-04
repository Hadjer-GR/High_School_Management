// deseign Add image profile
/*
 *
 *
 *
 */
const uploadimg = document.querySelectorAll("#file");
var uploadedpicture;

uploadimg.forEach((item) => {
  item.addEventListener("change", function () {
    const reader = new FileReader();
    reader.addEventListener("load", () => {
      uploadedpicture = reader.result;
      document.querySelector(
        ".img "
      ).style.backgroundImage = `url(${uploadedpicture})`;
      document.querySelector(
        ".imageprofil "
      ).style.backgroundImage = `url(${uploadedpicture})`;
    });
    reader.readAsDataURL(this.files[0]);
  });
});

const deletepicture = document.querySelectorAll(".delete");
deletepicture.forEach((item) => {
  item.addEventListener("click", (eo) => {
    document.querySelector(".img").style.backgroundImage = "none";
    document.querySelector(".imageprofil").style.backgroundImage = "none";
  });
});

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
