class Admin::PostsController < Admin::BaseController
    def index
        @posts = Post.order("created_at DESC").page(params[:page]).per(5)
    end

    def show
      @post = Post.where(id: params[:id]).first
    end

    def edit
      @post = Post.where(id: params[:id]).first
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path
      end
    end

    def update
      @post = Post.where(id: params[:id]).first
      if @post.update_attributes(post_params)
        redirect_to admin_posts_path
      else
        # Formular wieder rendern
      end
    end

    def destroy
      @post = Post.where(id: params[:id]).first
      if @post.destroy
        redirect_to admin_posts_path
      else
        # Formular wieder rendern
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, tag_ids: []) # =  :tag_ids => []
    end

end
