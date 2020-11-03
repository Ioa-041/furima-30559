function calc() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const price       = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit      = document.getElementById("profit");
    const taxVal      = Math.floor(price * 0.1);
    const profitVal   = price - taxVal;
    addTaxPrice.innerHTML = taxVal
    profit.innerHTML      = profitVal
  });
}

window.addEventListener("load", calc);