const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //#環境変数済み公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);