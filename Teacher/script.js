const body = document.querySelector("body"),
  sidebar = document.querySelector("nav"),
  toggle = document.querySelector(".toggle");
searchBtn = document.querySelector(".search-box");
modeSwitch = document.querySelector(".toggle-switch");
modeText = document.querySelector(".mode-text");

toggle.addEventListener("click", () => {
  if (sidebar.className == "sidebar close") {
    sidebar.classList.remove("close");
  } else if (sidebar.className == "sidebar") {
    sidebar.classList.add("close");
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

//  design dashboard

// design doughnut
let label1 = ["Absences", "Present", "Delay"];
let data1 = [20, 60, 20];
let colors1 = ["#FF2400", "#045F5F", "#837E7C"];
let colors2 = ["#FF4500", "#008080", "#A9A9A9"];

const mychart1 = document.querySelectorAll("#myChart");

mychart1.forEach((item) => {
  const myChart11 = new Chart(item.getContext("2d"), {
    type: "doughnut",
    data: {
      labels: label1,
      datasets: [
        {
          data: data1,
          backgroundColor: colors1,
          hoverBackgroundColor: colors2,
          borderColor: "#ffff",
          borderWidth: 4,
        },
      ],
    },
    options: {
      title: {
        text: "Absences And Delay",
        display: true,
      },
      aspectRatio: 1.9,
    },
  });
});

/**
 *
 *
 */
// design Bar chart for the result note  of student in this Semester in index.html

const mychart2 = document.querySelectorAll("#myChart2");

let label2 = ["G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8"];
let data2 = [10, 20, 5, 20, 2, 5, 0, 20];
let data3 = [25, 20, 25, 15, 22, 35, 40, 10];

let colors21 = [
  "#fa8072",
  "#00ced1",
  "#3eb489",
  "#b38481",
  "#657383",
  "#695cfe",
  "#ffdb58 ",
  "#307d7e",
];

mychart2.forEach((item) => {
  const myChart22 = new Chart(item.getContext("2d"), {
    type: "bar",
    data: {
      labels: label2,
      datasets: [
        {
          label: "Fail",
          data: data2,
          backgroundColor: "#F70D1A",
          borderColor: "#ffff",
          borderWidth: 4,
        },
        {
          label: "Successful",
          data: data3,
          backgroundColor: "#438D80",
          borderColor: "#ffff",
          borderWidth: 4,
        },
      ],
    },
    options: {
      title: {
        text: "the Result of the student in this Semester",
        display: true,
      },
      plugins: {
        legend: false,
      },

      aspectRatio: 2,
      scales: {
        xAxes: {
          stacked: true,
        },
        yAxes: {
          stacked: true,
        },
      },
    },
  });
});

/**
 *
 *
 */

/*
 *
 *
 *
 *
 *
 */

// design script inside etud

/*
 *
 *
 *
 *
 *
 */
// design color inside textbook

const othermodel = document.querySelector(".othermodel");

const content = document.getElementById("contentmodel");

othermodel.addEventListener("click", (eo) => {
  switch (eo.target.className) {
    case "physique":
      content.style.border = "2px solid #3eb489";
      break;
    case "science":
      content.style.border = "2px solid #00ced1";
      break;
    case "sport":
      content.style.border = "2px solid #307d7e";
      break;
    case "sport2":
      content.style.border = "2px solid #c88141";
      break;
    case "arabic":
      content.style.border = "2px solid #b38481";
      break;
    case "french":
      content.style.border = "2px solid #657383";
      break;
    case "english":
      content.style.border = "2px solid #695cfe";
      break;
    case "islamia":
      content.style.border = "2px solid #ffdb58";
      break;
    default:
      content.style.border = "2px solid #fa8072";
  }
});

// design click btn Absences And Delay
/*
 *****
 *
 *
 *
 */
const absences = document.getElementById("contentAbsent");
console.log(absences);
const showabsences = document.querySelectorAll("#checkabsences");
showabsences.forEach((item) => {
  item.addEventListener("change", (eo) => {
    if (item.checked) {
      absences.style.display = "block";
    } else {
      absences.style.display = "none";
    }
  });
});

// design statistics in home
/*
 *
 *
 *
 *
 *
 */
