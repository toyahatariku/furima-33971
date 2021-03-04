if (location.pathname.match("items/new")){ //出品画面に遷移したら発火
  document.addEventListener("DOMContentLoaded", () => { //画面が読み込まれたら発火
    const inputElement = document.getElementById("item-tag"); //ID"item-tag"があれば代入
    inputElement.addEventListener("keyup", () => { //キー入力が離れたら発火
      const keyword = document.getElementById("item-tag").value; //入力された文字を代入
      const XHR = new XMLHttpRequest(); //XMLHttpRequestの生成と初期化をし変数XHRに代入
      XHR.open("GET", `search/?keyword=${keyword}`, true); //リクエストするHTTPメソッドの定義
      XHR.responseType = "json"; //リクエストする形式の定義（json＝データのみを扱う）
      XHR.send(); //リクエストを送信する
      XHR.onload = () => { //リクエストが帰って来たら発火
        const searchResult = document.getElementById("search-result"); //ID：search-resultを探して代入する
        searchResult.innerHTML = ""; //searchResultをnilにする
        if (XHR.response) { //XHR.responseがあれば発火
          const tagName = XHR.response.keyword; //レスポンスのkeywordを代入
          tagName.forEach((tag) => { //tagNameに入っているものをeachで順次処理する
            const childElement = document.createElement("div"); //divを作成しchildeElementに定義する
            childElement.setAttribute("class", "child"); //クラスを定義する
            childElement.setAttribute("id", tag.id); //IDを定義する
            childElement.innerHTML = tag.tag; //tagカラムの文字を定義する
            searchResult.appendChild(childElement); //親ノードsearchResultの末尾に子ノードで追加する
            const clickElement = document.getElementById(tag.id); //作成したdivのtag.IDを代入する
            clickElement.addEventListener("click", () => { //clickElementに入ったIDの要素をクリックすると発火
              document.getElementById("item-tag").value = clickElement.textContent; //ID:item-tagの値にクリックした要素のtextContentを代入
              clickElement.remove(); //クリックした要素を削除する
            });
          });
        };
      };
    });
  });
};