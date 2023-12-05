class ItemsController < ApplicationController
  before_action :set_item, only: %i[ destroy ]

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.turbo_stream { render :create, status: :created, location: @item }
        format.html { redirect_to items_url, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy!

    respond_to do |format|
      format.turbo_stream { render :destroy, status: :ok, location: @item }
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:body)
    end
end
