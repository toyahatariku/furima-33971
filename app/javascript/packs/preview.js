if (document.URL.match( /items/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    const ImageInputs = document.getElementById('image_inputs');

    //選択した画像を表示する関数
    const createImageHTML = (blob) => {
      //画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div'); 
      imageElement.setAttribute('class', `image-element`);
      let imageElementNum = document.querySelectorAll('.image-element').length
      
      //表示する画像を生成
      const blobImage = document.createElement('img'); 
      blobImage.setAttribute('id', `item-img_${imageElementNum}`);
      blobImage.setAttribute('class', `item-img`);
      blobImage.setAttribute('src', blob);
      //ファイル選択ボタンを生成
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id',`item-file_${imageElementNum + 1}`);
      inputHTML.setAttribute('class',`item-file`);
      inputHTML.setAttribute('name', 'item[images][]');
      inputHTML.setAttribute('type', 'file');
      
      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageInputs.appendChild(inputHTML);
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) =>{
        const imageContent = document.getElementById(`item-img_${imageElementNum + 1}`);
        if (imageContent){ // 画像がある場合のみ選択した画像に差し替える
          imageContent.src=window.URL.createObjectURL(e.target.files[0]);
        } else {  //画像がない場合は画像と選択ボタンを追加する
          file = e.target.files[0];
          blob = window.URL.createObjectURL(file);
          
          createImageHTML(blob)
        };
      })
    };

    //画像の数を数え各選択項目にイベントを設置
    let imageElementNum = document.querySelectorAll('.image-element').length
    for( let i = 0 ; i <= imageElementNum ; i++ ) {
      document.getElementById(`item-file_${i}`).addEventListener('change', function(e){
        const imageContent = document.getElementById(`item-img_${i}`);
        if (imageContent){ //画像がある場合のみ選択した画像に差し替える
          imageContent.src=window.URL.createObjectURL(e.target.files[0]);
        } else {  //画像がない場合は画像と選択ボタンを追加する
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
        };
      });
    };

  });
};
