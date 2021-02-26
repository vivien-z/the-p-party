const list = (words) => {
// 1. target the list
  const resultList = document.querySelector("#search-navbar input");
  console.log(resultList)
  resultList.innerHTML = '';
  words.forEach((word) => {
    resultList.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  });
};

list();
console.log("hello");

//////
const list = (words) => {
// 1. target the list
  const resultList = document.querySelector("#results");
  resultList.innerHTML = '';
  words.forEach((word) => {
    resultList.insertAdjacentHTML('beforeend', `<li>${word}</li>`);
  });
};

// 3.use (api and input) value to retrive a list back
const autoSearch = (keyword) => {
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${keyword}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      list(data.words);
    });
};

// 2.listen to event type: focus/input
const input = document.querySelector("#search");
document.addEventListener('keyup', () => {
  autoSearch(input.value);
});
