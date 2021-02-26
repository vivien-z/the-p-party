const time = (date) => {
  const timeDiff = Date.now() - Date.parse(date);
  return Math.round(timeDiff / 1000 / 60);
};

const listMessage = () => {
  const url = `${baseUrl}${batch}/messages`;
  fetch(url)
    .then(response => response.json())
    .then((dataAll) => {
      const messages = dataAll.messages;
      messages.forEach((message) => {
        const messageToList = `<li>${message.content} (posted <span class="date">${time(message.updated_at)}  minutes ago</span>) by ${message.author}</li>`;
        const list = document.querySelector(".list-unstyled");
        // console.log(list.innerHTML);
        list.insertAdjacentHTML('beforeend', messageToList);
      });
    });
};

const refreshBtn = document.querySelector("#refresh");
refreshBtn.addEventListener('click', (event) => {
  event.preventDefault();
  listMessage();
});

// send
const yourMessage = document.querySelector("#your-message");
const author = document.querySelector("#your-name");
const btnSend = document.querySelector(".btn-info");

const sendMessage = () => {
  // yourMessage = yourMessage === '' ? "Enter your message" : yourMessage;
  // author = author === '' ? "Enter author name" : author;
  const url = `${baseUrl}${batch}/messages`;
  fetch(url, {
    method: "POST",
    body: JSON.stringify({ author: author.value, content: yourMessage.value })
  }).then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

btnSend.addEventListener('click', (event) => {
  event.preventDefault();
  sendMessage();
  listMessage();
});
