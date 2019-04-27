class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    # @todos = Todo.all.where(is_done: 1)
    # @todos = Todo.search(params[:word]).paginate(page: params[:page], per_page: 10)
    # @todos = Todo.search(params[:word]).paginate(page: params[:page], per_page: 3)
    @todos = Todo.search(params[:word]).paginate(page: params[:page], per_page: 3).where(user_id: current_user.id)
    @today = Date.today
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /todos/1
  # PATCH /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH /todos/1
  # PATCH /todos/1.json
  def done
    @todo = Todo.find(params[:id])
    @todo.toggle!(:is_done)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      todo_params = params.require(:todo).permit(:name, :content, :end_date, :is_done, :image_url)
      user_id = current_user.id
      todo_params.merge!(user_id: user_id)
    end
end
