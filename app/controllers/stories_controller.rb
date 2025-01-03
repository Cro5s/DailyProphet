class StoriesController < ApplicationController
  def index
    @stories = Story.includes(:author).all

    if @stories.any?
      render :index
    else
      render json: { stories: [] }
    end
  end

  def show
    @stroy = Story.includes(:author, :responses).find(params[:id])
    render :show
  end

  def create
    @story = Story.new(story_params)

    @story.author_id = Current.user.id

    if @story.save
      render :show
    else
      render json: @story.errors.full_message, status: 401
    end
  end

  def updated
    @story = Story.find(params[:story][:id])

    if @story.update(story_params)
      render :show
    else
      render json: @story.errors.full_message, status: 401
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @stroy.destroy
    @stories = Story.includes(:author).all

    render :index
  end

  private

  def story_params
    params.require(:story).permit(:title, :body, :image, :author_id)
  end
end
