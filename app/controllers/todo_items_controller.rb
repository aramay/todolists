class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET /todo_items
  # GET /todo_items.json
  def index
    @todo_items = TodoItem.all
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
   #   binding.pry
  end

  # GET /todo_items/new
  def new
      #  @todo_item = TodoItem.new
      @todo_list = TodoList.find(params[:todo_list_id])
      @todo_item = @todo_list.todo_items.new

  end

  # GET /todo_items/1/edit
  def edit
     set_todo_item
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
     p params

   #   binding.pry
    @todo_list = TodoList.find(params[:todo_list_id])
   #  @todo_item = @todo_list.todo_items.new(todo_item_params)
    @todo_item = @todo_list.todo_items.create(todo_item_params)

    redirect_to todo_list_path(@todo_list)

   #  respond_to do |format|
   #    if @todo_item.save
   #      format.html { redirect_to @todo_item, notice: 'Todo item was successfully created.' }
   #      format.json { render :show, status: :created, location: @todo_item }
   #    else
   #      format.html { render :new }
   #      format.json { render json: @todo_item.errors, status: :unprocessable_entity }
   #    end
   #  end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
     p params

      #  binding.pry
     @todo_list = TodoList.find(params[:todo_list_id])

    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_list_path(@todo_list), notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy

     @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item.destroy

    redirect_to todo_list_path(@todo_list)
   #  respond_to do |format|
   #    format.html { redirect_to todo_items_url, notice: 'Todo item was successfully destroyed.' }
   #    format.json { head :no_content }
   #  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      # list_id = TodoList.first.id
      @todo_list = TodoList.find(params[:todo_list_id])
      item_id = @todo_list.todo_items.first.id
      @todo_item = TodoItem.find(item_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:title, :due_date, :description, :completed)
    end
end
