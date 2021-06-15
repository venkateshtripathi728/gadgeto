class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index,:show]

  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @tools = Tool.all
  end

  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new 
    end
  end
  
  def edit
  end

  def update
    @tool.update(tools_params)
  end

  def destroy
    @tool.destroy
    redirect_to tools_path
  end

  private
  def set_tool
      @tool = Tool.find(params[:id])
  end

  def tools_params
    params.require(:tool).permit(:name, :description, :price, :longitude, :latitude, :address, :category)
  end
end

