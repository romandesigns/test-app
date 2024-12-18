const app = require("express");
const server = app();

const PORT = process.env.PORT || 1010;

server.use(app.json());
server.use(app.urlencoded({ extended: true }));
server.use(app.static("public"));

server.get("/", (req, res) => {
  return res.sendFile(__dirname + "index.html");
});

server.get("/about", (req, res) => {
  return res.sendFile(__dirname + "about.html");
});

server.listen(PORT, () => console.log(`App up and running in port ${PORT}`));
