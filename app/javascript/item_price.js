window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const resultPrice = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = resultPrice;
    const salesProfit = inputValue - resultPrice;
    profit.innerHTML = salesProfit;

    
    


  })
});