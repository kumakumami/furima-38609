window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
 const addTax = document.getElementById("add-tax-price");
 addTax.innerHTML =Math.floor(priceInput.value * 0.1 );
 const proFit = document.getElementById("profit");
 proFit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1) );

})
});


// <%# 販売価格 %>
// <div class="sell-price">
//   <div class="weight-bold-text question-text">
//     <span>販売価格<br>(¥300〜9,999,999)</span>
//     <a class="question" href="#">?</a>
//   </div>
//   <div>
//     <div class="price-content">
//       <div class="price-text">
//         <span>価格</span>
//         <span class="indispensable">必須</span>
//       </div>
//       <span class="sell-yen">¥</span>
//       <%= f.text_field :item_price, class:"price-input", id:"item-price", placeholder:"例）300" %>
//     </div>
//     <div class="price-content">
//       <span>販売手数料 (10%)</span>
//       <span>
//         <span id='add-tax-price'></span>円
//       </span>
//     </div>
//     <div class="price-content">
//       <span>販売利益</span>
//       <span>
//         <span id='profit'></span>円
//     </div>
//     </span>
//   </div>
// </div>