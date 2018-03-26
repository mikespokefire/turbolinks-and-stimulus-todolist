class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :toggle]

  # GET /todos
  def index
    @uncompleted_todos = Todo.uncompleted.all
    @completed_todos = Todo.completed.all
  end

  # GET /todos/1
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
  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        flash[:notice] = 'Todo was successfully created.'
        format.html { redirect_to todos_url }
      else
        flash.now[:error] = 'Ruh roh!'
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /todos/1
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url, notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
    end
  end

  def toggle
    @todo.completed = !@todo.completed
    @todo.save!

    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo completeness toggled.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :completed)
    end
end
