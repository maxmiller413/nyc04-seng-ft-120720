class ItemsController < ApplicationController
  def index
    @items = Item.all 
    # this method should respond with a view that shows a list of items
    # render :'items/index'
  end

  def new 
    @item = Item.new
  end

  def create 
    new_item = Item.create(name: params[:name], image: params[:image], description: params[:description], price: params[:price])
    # either send the user to the index or the show 
    # do I need a create view? 

    # URL helper
    # redirect_to '/items'
    redirect_to items_path # => '/items'
    # redirect_to "/items/#{new_item.id}"
    # redirect_to "www.google.com"
  end

  def show 
    # params hold data coming from the route and request
    # in this case our route is send additional data in the form of an :id dynamic argument
    # it takes the dynamic argument and makes it a key => id: 
    # it reads the route at the :id place to see what the user typed in =>  the item's id that they clicked on
    @item = Item.find(params[:id])
    # params => it's an object created by rails 
    # created to hold data coming from our requests 
    # yesterday's data was the "id" from the route 

    # {id: }
  end
end


#Strategy
# 1. Item.all => array of items
# where? => controller 
# 2. iterate through that array 
# 3. Print the name and image of each item in the view

# 1. find_by/find