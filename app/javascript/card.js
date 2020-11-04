  const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form);
    const card = {
      number: document.getElementById('card-number').value,
      cvc: document.getElementById('card-cvc').value,
      exp_month: document.getElementById('card-exp-month').value,
      exp_year: `20${document.getElementById('card-exp-year').value}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='buyer_item_purchase[token]' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
  })
  })
  }
  window.addEventListener("load", pay);