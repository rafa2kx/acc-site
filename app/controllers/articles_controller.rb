class ArticlesController < ApplicationController
  before_action :get_article_class, only: [:index, :paginate, :scroll, :new , :create, :edit, :update]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_classification, only: [:new, :edit]

  before_action :authenticate_user!, only: [:dashboard, :paginate, :new, :edit, :create, :update, :destroy]


  def home
    @articles = New.last(5)
  end

  def index
    @articles = @article_class.all.where(classification:params[:classification]).order(published: :desc)
    if(@type == 'New' || @type == 'Event')
      return render "articles.html.erb";
    else
      return render "#{@type.downcase}s.html.erb";
    end
  end


  def show

  end

  def scroll

    @page = params[:page]
    @result = @article_class.page(@page).per(5)
    # respond_to do |format|
    #   format.js
    # end
    render layout: false
  end

  def dashboard
    @recipes = Recipe.page(1).per(10)
    @news = New.page(1).per(10)
    @events = Event.page(1).per(10)
    @history = History.page(1).per(10)
    @bars = Bar.page(1).per(10)
    @users = User.page(1).per(10)
  end

  def paginate
    @page = params[:page]
    @result = @article_class.page(@page)
    respond_to do |format|
      format.js
    end
  end


  # GET /articles/new
  def new
    @article = Article.new
    @article.type = @type
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    Article.transaction do
      begin

        @article = @article_class.create(article_params)
        if !image_params.nil?
          image_params.each do |key, uploaded_image|
            image = Image.new
            image.content = uploaded_image[:content]
            image.article = @article
            if !image.save
              raise image.errors.message
            end
          end
        end
        return redirect_to request.referer, alert: {success: 'Articulo guardado satisfactoriamente'}
      rescue Exception => e
        @error = e.message
        render(file: 'public/500.html')
        raise ActiveRecord::Rollback, @error
      end
    end
  end



  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  def destroy

    @article.destroy
    respond_to do |format|
      format.js { head :no_content }
    end
  end



  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_classification

    @classifications = []
    @article_class.constants.each do |constant_name|
      if(constant_name.to_s.ends_with?('_CLASS'))
        constant = @article_class.const_get(constant_name)
        classification = ["#{t(constant)}", constant]
        @classifications << classification
      end
    end
  end

  def article_params
    params.permit(article:[:title, :published, :content, :author, :classification, :steps, :source, {ingredients: [:name]}])[:article]
    # params.permit(article:[:title, :content, :author, :classification, {steps: [:name]}, {ingredients: [:name]}])[:article]
  end

  def image_params
    params[:image]
  end

  def type_param
    params[:type]
  end

  def get_article_class
    type = type_param
    @type = type.slice(0..1).capitalize + type.slice(2..-1)
    @article_class = Object.const_get(@type)
  end

end
