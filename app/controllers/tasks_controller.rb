class TasksController < ApplicationController
  def index
    @tasks = Bulldoggy.fetch
  end

  def create
    Bulldoggy.add_task(params[:task][:description])
    redirect_to action: 'index'
  end
end
