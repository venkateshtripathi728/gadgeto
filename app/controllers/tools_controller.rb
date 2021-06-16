class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:  [:index, :show]
  

  def index

    @tools = policy_scope(Tool).order(created_at: :desc)

  end
  
  def show     
    authorize @tool
    @booking = Booking.new
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tools_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
    authorize @tool
  end

  def edit
    authorize @tool
  end

  def update
    if @tool.update(tools_params)
      redirect_to tool_path(@tool)
    else
      render :new
    end
    authorize @tool
  end

  def destroy
    @tool.destroy
    redirect_to tools_path
    authorize @tool
  end

  private

  def set_tool
      @tool = Tool.find(params[:id])
  end

  def tools_params
    params.require(:tool).permit(:tool_name, :tool_description, :price, :longitude, :latitude, :address, :category, :photo)
  end

end

