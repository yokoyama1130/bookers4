class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def destroy
    # 削除するPostImageレコードを取得
    post_image = PostImage.find(params[:id]) 
    # 削除
    post_image.destroy
    # PostImageの一覧ページへのパス
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
      params.require(:post_image).permit(:book_name, :image, :caption)
  end
end
