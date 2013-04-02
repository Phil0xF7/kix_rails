class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :taskCheck

  # someone needs to refactor this.
  def taskCheck
    if Task.where(:user_id => current_user.id).empty?

      @makeNewTask = Task.new
      @makeNewTask.type_task = 0
      @makeNewTask.user_id = current_user.id
      @makeNewTask.save

      @makeNewTask1 = Task.new
      @makeNewTask1.type_task = 1
      @makeNewTask1.user_id = current_user.id
      @makeNewTask1.save

      @makeNewTask2 = Task.new
      @makeNewTask2.type_task = 2
      @makeNewTask2.user_id = current_user.id
      @makeNewTask2.save

      @makeNewTask3 = Task.new
      @makeNewTask3.type_task = 3
      @makeNewTask3.user_id = current_user.id
      @makeNewTask3.save

      @makeNewTask4 = Task.new
      @makeNewTask4.type_task = 4
      @makeNewTask4.user_id = current_user.id
      @makeNewTask4.save

      @makeNewTask5 = Task.new
      @makeNewTask5.type_task = 5
      @makeNewTask5.user_id = current_user.id
      @makeNewTask5.save

      @makeNewTask6 = Task.new
      @makeNewTask6.type_task = 6
      @makeNewTask6.user_id = current_user.id
      @makeNewTask6.save

      @makeNewTask7 = Task.new
      @makeNewTask7.type_task = 7
      @makeNewTask7.user_id = current_user.id
      @makeNewTask7.save

      @makeNewTask8 = Task.new
      @makeNewTask8.type_task = 8
      @makeNewTask8.user_id = current_user.id
      @makeNewTask8.save

      @makeNewTask9  = Task.new
      @makeNewTask9 .type_task = 9
      @makeNewTask9 .user_id = current_user.id
      @makeNewTask9 .save

      @makeNewTask10 = Task.new
      @makeNewTask10.type_task = 10
      @makeNewTask10.user_id = current_user.id
      @makeNewTask10.save

      @makeNewTask11 = Task.new
      @makeNewTask11.type_task = 11
      @makeNewTask11.user_id = current_user.id
      @makeNewTask11.save

      @makeNewTask12 = Task.new
      @makeNewTask12.type_task = 12
      @makeNewTask12.user_id = current_user.id
      @makeNewTask12.save

      @makeNewTask13 = Task.new
      @makeNewTask13.type_task = 13
      @makeNewTask13.user_id = current_user.id
      @makeNewTask13.save

      @makeNewTask14 = Task.new
      @makeNewTask14.type_task = 14
      @makeNewTask14.user_id = current_user.id
      @makeNewTask14.save

      @makeNewTask15 = Task.new
      @makeNewTask15.type_task = 15
      @makeNewTask15.user_id = current_user.id
      @makeNewTask15.save

      @makeNewTask16 = Task.new
      @makeNewTask16.type_task = 16
      @makeNewTask16.user_id = current_user.id
      @makeNewTask16.save

      @makeNewTask17 = Task.new
      @makeNewTask17.type_task = 17
      @makeNewTask17.user_id = current_user.id
      @makeNewTask17.save

      @makeNewTask18 = Task.new
      @makeNewTask18.type_task = 18
      @makeNewTask18.user_id = current_user.id
      @makeNewTask18.save

      @makeNewTask19 = Task.new
      @makeNewTask19.type_task = 19
      @makeNewTask19.user_id = current_user.id
      @makeNewTask19.save

      @makeNewTask20 = Task.new
      @makeNewTask20.type_task = 20
      @makeNewTask20.user_id = current_user.id
      @makeNewTask20.save

      @makeNewTask21 = Task.new
      @makeNewTask21.type_task = 21
      @makeNewTask21.user_id = current_user.id
      @makeNewTask21.save

      @makeNewTask22 = Task.new
      @makeNewTask22.type_task = 22
      @makeNewTask22.user_id = current_user.id
      @makeNewTask22.save

      @makeNewTask123 = Task.new
      @makeNewTask123.type_task = 23
      @makeNewTask123.user_id = current_user.id
      @makeNewTask123.save

      @makeNewTask24 = Task.new
      @makeNewTask24.type_task = 24
      @makeNewTask24.user_id = current_user.id
      @makeNewTask24.save
    end
  end

  # GET /tasks
  # GET /tasks.json
  def app
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id


    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    params[:task][:completed].to_i == 1 ? completed = DateTime.now().to_s : completed = nil
    params[:task][:completed] = completed

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  #GET /tasks/test
  def test_update
    @tasks = Task.where(:user_id => current_user)

    respond_to do |format|
      format.html #test_update.html.erb
      format.json {render json: @allTasks}
    end
  end

  # try making method that creates task upon sign up


end





