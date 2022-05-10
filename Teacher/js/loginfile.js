const btnfileupload = `<i class='bx bx-file'></i>`;

const filedegree = document.querySelector("#degreefile");
const btndegree = document.querySelector(".btndegree");
console.log(btndegree);

filedegree.onchange = ({ target }) => {
  let file = target.files[0];
  if (file) {
    btndegree.innerHTML = btnfileupload;
  }
};
