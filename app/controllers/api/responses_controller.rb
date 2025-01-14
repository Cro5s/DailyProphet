class Api::ResponsesController < ApplicationController
  before_action :ensure_logged_in

  def index
    @responses = Response.includes(params[:story_id]).all

    if @responses.any?
      render :index
    else
      render json: { responses: [] }
    end
  end

  def create
    @response = Response.new(response_params)

    @response.author_id = Current.user.id

    if @response.save
      render :show
    else
      render json: @response.errors.full_messages, status: 401
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    @responses = Response.includes(:author).all

    render :show
  end

  private

  def response_params
    params.require(:response).permit(:body, :story_id, :author_id)
  end
end
