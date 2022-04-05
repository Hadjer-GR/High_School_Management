// design color inside textbook

const othermodel = document.getElementById("othermodel");
console.log(othermodel);

const content = document.querySelector(".contentlesson");
console.log(content);

othermodel.addEventListener("click", (eo) => {
  switch (eo.target.className) {
    case "physique":
      content.style.border = "4px solid #3eb489";
      break;
    case "science":
      content.style.border = "4px solid #00ced1";
      break;
    case "sport":
      content.style.border = "4px solid #307d7e";
      break;
    case "sport2":
      content.style.border = "4px solid #c88141";
      break;
    case "arabic":
      content.style.border = "4px solid #b38481";
      break;
    case "french":
      content.style.border = "4px solid #657383";
      break;
    case "english":
      content.style.border = "4px solid #695cfe";
      break;
    case "islamia":
      content.style.border = "4px solid #ffdb58";
      break;
    default:
      content.style.border = "4px solid #fa8072";
  }
});
