class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # 重複処理をまとめる
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new
    end
  end

  def show
  end

  def edit
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    # バリデーションがOKであれば詳細画面へ
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      render 'edit'
    end
  end

  def destroy
    # ログインしているユーザーと同一であればデータを削除する
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :condition_id, :postage_id, :first_add_id, :send_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end  

end
