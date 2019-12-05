# coding: utf-8
class TopicsController < ApplicationController

  @@defbody = ''

  def index
    @topics = Topic.all
    @newTopic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
    @body = @@defbody
    @@defbody = ''
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title))
    @topic.save
    redirect_to topics_index_path
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def editTitle
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic].permit(:title)['title']
    @topic.save
    redirect_to topics_index_path
  end

  def reply # 投稿に返信
    @post = Post.find(params[:id])
    @topicId = @post.topic_id
    @@defbody = '>>' + @post.id.to_s
    redirect_to topics_show_path(@topicId)
  end

end
