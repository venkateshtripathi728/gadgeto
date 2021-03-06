class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:  [:index, :show,:mytools]
  skip_after_action :verify_policy_scoped, only: [:index]
  

  def index
    @query = { tool: params[:tool], address: params[:address] }
    if @query.values.all? { |x| x == ""  } || @query.values.all? { |x| x == nil }
    @tools = Tool.where("user_id != ?", current_user.id) if user_signed_in?
    @tools = Tool.all unless user_signed_in?
    else
      @tools = Tool.global_search("#{params[:tool]} #{params[:address]}").where("user_id != ?", current_user.id) if user_signed_in?
      @tools = Tool.global_search("#{params[:tool]} #{params[:address]}") unless user_signed_in?
    end



    # if user_signed_in?
    #   if params[:query].present?
    #    @tools = policy_scope(Tool).order(created_at: :desc).where("user_id !=?" , current_user.id).where("tool_name ILIKE ?", "%#{params[:query]}%")
    #    if @tools.empty?
    #      flash[:msg] = "Looks like no one proposed #{params[:query]}, see all tools below"
    #     redirect_to action: "index"
    #    end
    #   else
    #    @tools = policy_scope(Tool).where("user_id !=?" , current_user.id).order(created_at: :desc)
    #   end

    # else
    #    if params[:query].present?
    #    @tools = policy_scope(Tool).order(created_at: :desc).where("tool_name ILIKE ?", "%#{params[:query]}%")
    #    if @tools.empty?
    #      flash[:msg] = "Looks like no one proposed #{params[:query]}, see all tools below"
    #     redirect_to action: "index"
    #    end
    #   else
    #    @tools = policy_scope(Tool).order(created_at: :desc)
    #   end
    # end
  end

  def mytools
    @query = {tool: params[:tool],address: params[:address]}
    if @query.values.all? {|x| x == ""  } || @query.values.all? {|x| x == nil  }
      @tools = policy_scope(Tool).all.where("user_id = ?", current_user.id)
      authorize @tools
    else 
      @tools = policy_scope(Tool).global_search(@query.values.join(" "))
      authorize @tools
    end 
  end


  

  def show
    authorize @tool
    @markers = [{ lat: @tool.latitude, lng: @tool.longitude, info_window: render_to_string(partial: "info_window", locals: { tool: @tool }),image_url: helpers.asset_url('https://image.flaticon.com/icons/png/512/1397/1397898.png') }]
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

