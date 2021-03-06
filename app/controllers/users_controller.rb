class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def new
    @user = User.new
    @departments = Department.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def create
    # todo password reinput check
    @user = User.new(params[:user])
    @departments = Department.all
    if params[:department_id] == nil
      @department_id = "0"
    else
      @department_id = params[:department_id]
    end
    @user.department_id = @department_id.to_i
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @departments = Department.all
  end

  def update
    # todo password reinput check
    @user = User.find(params[:id])
    @departments = Department.all
    @user.department_id = params[:department_id].to_i
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def make_admin
    user = User.find(params[:id])
    user.update_attribute :admin, true
    redirect_to users_path
  end

  def remove_admin
    user = User.find(params[:id])
    user.update_attribute :admin, false
    redirect_to users_path
  end

end
