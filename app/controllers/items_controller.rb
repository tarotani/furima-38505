class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @item = Item.find(params[:id])
  end

  def edit
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    # バリデーションがOKであれば詳細画面へ
    if @item.valid?
      redirect_to item_path(item_params)
    else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      render 'edit'
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :condition_id, :postage_id, :first_add_id, :send_day_id).merge(user_id: current_user.id)
  end  

end
