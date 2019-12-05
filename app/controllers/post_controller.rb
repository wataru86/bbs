# coding: utf-8
class PostController < ApplicationController

  ESCAPE_TABLE = {
    '&' => '&amp;',
    '<' => '&lt;',
    '>' => '&gt;',
    '"' => '&quot;',
    "'" => '&#39;'
  }

  def escape_html(str)
    str.gsub(/[&<>"']/, ESCAPE_TABLE).gsub(/(\r\n|\r|\n)/, "<br>")
  end

  def format_reply(str)
    str.gsub(/&gt;&gt;(\d+)/, '<a href="#\1">&gt;&gt;\1</a>')
  end

  def create # 新しい投稿の作成
    @post = Post.new(params[:post].permit(:topic_id, :name, :body))
    x = params[:post][:body]
    @post.body = format_reply(escape_html(x))
    @post.save
    redirect_to topics_show_path(params[:post]['topic_id'])
  end
  def delete # 投稿の削除
    @post = Post.find(params[:id])
    @topicId = @post.topic_id
    @post.destroy
    redirect_to topics_show_path(@topicId)
  end
end
