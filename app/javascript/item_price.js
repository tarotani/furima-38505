window.addEventListener("input", () => {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue/10);
  const pricePay = document.getElementById("profit");
  pricePay.innerHTML = Math.floor(inputValue - inputValue/10);
}) 