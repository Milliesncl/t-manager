class TasksController < ApplicationController
    before_action :get_list

    def index
        # @list = List.find(params.id)
        @tasks = Task.all
    end

   def new
        @task = Task.new
   end

   def create
        @task = Task.new(task_params)
        @task.list_id = @list.id

        if @task.save
            redirect_to list_tasks_path(@list.id)
        else
            raise
            render :new
        end
   end

   def edit
   end

   def update
   end

   def destroy
   end

   private

   def get_list
    @list = List.find(params[:list_id])
   end

   def task_params
    params.require(:task).permit(:title, :details, :completed)
   end
end
