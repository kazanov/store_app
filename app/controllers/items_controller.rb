class ItemsController < ApplicationController

	before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]

	def index
		@items = Item.all
	end

	# /items/1 GET
	def show
		unless @item
			render text: "Page not found", status: 404
		end
	end

	def expensive
		@items = Item.where("price > 1000")
		render "index"
	end

	# /items/new GET
	def new
		@item = Item.new
	end

	# /items/1/edit GET
	def edit
	end

	# /items POST
	def create
		@item = Item.create(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

	# /items/1 PUT
	def update
		@item.update_attributes(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end		
	end

	# /items/1 DELETE
	def destroy
		@item.destroy
		redirect_to action: "index"
	end

	def upvote
		@item.increment!(:votes_count)
		redirect_to action: :index
	end

	private

		def find_item
			# @item = Item.find(params[:id])
			@item = Item.where(id: params[:id]).first
			render_404 unless @item 
		end

		def items_params
		   params.require(:item).permit(:name, :price, :description, :real, :weight)
		end

end
