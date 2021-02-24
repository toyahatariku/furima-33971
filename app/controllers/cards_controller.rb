class CardsController < ApplicationController
  def new
      @card = Card.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:token] # 登録しようとしているカード情報
    )
    card = Card.new( # トークン化されたカード情報を保存する
      card_token: params[:token], # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
    if card.save
      redirect_to root_path
    else
      @card = card
      render 'new' # カード登録画面
    end  
  end
end
