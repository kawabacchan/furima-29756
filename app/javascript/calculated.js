function calculate (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener('input', () => {
    tax = Math.floor(itemPrice.value * 0.1 )
    addTaxPrice.innerHTML = `${ tax }`;
    profit.innerHTML = `${ itemPrice.value - tax }`;
  });
}
setInterval(calculate, 1000)