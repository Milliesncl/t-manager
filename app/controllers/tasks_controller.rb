class TasksController < ApplicationController
    before_action :get_list

    def index
        @tasks = @list.tasks
        @task = Task.new
    end

    # def show
    #     @task = Task.find(params[:id])
    # end
#    def new
#         @task = Task.new
#    end

   def create
        @task = Task.new(task_params)
        @task.list_id = @list.id

        if @task.save
            redirect_to list_tasks_path(@task.list_id)
        else
            render :new
        end
   end

   def edit
    @task = Task.find(params[:id])
   end

   def update
    @task = Task.find(params[:id])
    task_params[:completed] = task_params[:completed] == '0' ? false : true
    @task.update(task_params)

    redirect_to list_tasks_path(@list.id)
  end

   def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_tasks_path(@list.id)
   end

   private

   def get_list
    @list = List.find(params[:list_id])
   end

   def task_params
    params.require(:task).permit(:title, :details, :completed)
   end
end
