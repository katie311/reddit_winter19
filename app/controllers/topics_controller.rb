class TopicsController < ApplicationController
  before_action :set_sub
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    #GET - /subs/:sub_id/topics
    @topics = @sub.topics
  end

  def show
    #GET - /subs/:sub_id/topics/:id
    #alt: @topic = @sub.topics.find(params[:id])
  end

  def new
    #GET - /subs:sub_id/topics/new
    @topic = @sub.topics.new
    render partial: "form"
  end

  def create
    #POST - /subs/:sub_id/topics
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to sub_topic_path(@sub, @topic)
    else
      render :new
    end
  end


  def edit
    #GET /subs/:sub_id/topics/:id/edit
    render partial: "form"
  end

  def update
    #PUT /subs/:sub_id/topics/:id
    if @topic.update(topic_params)
    redirect_to sub_topics_path(@sub)
    else
      render :edit
    end
  end

  def destroy
    #DELETE /subs/:sub_id/topic/:topic_id
    @topic.destroy
    redirect_to sub_topics_path(@sub)
  end
end

private
  def set_sub
    @sub = Sub.find(params[:sub_id])
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :body)
  end


