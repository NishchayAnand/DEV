const cart = [];

function log(message) {
  console.log("log: " + message);
}

function addToCart(item) {
  cart.push(item);
  log("added " + item);
}

function removeFromCart(idx) {
  cart.splice(idx, 1);
  log("removed " + item);
}

addToCart("Waterproof Boots");
