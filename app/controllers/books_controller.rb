class BooksController < ApplicationController
  #onlyで指定されたアクションを実行する前にset_bookメソッドを実行する仕組み
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    # IDとパスワードを受け取って、DBで確認して、ログイン成功したとする
    session[:user_id] = "Sano";

    @books = Book.all
    # render json: @books # JSON形式でデータを返すことができる
    # 本当はビューの名前を書く必要がある
    # render 'greeting/index'
  end

  # GET /books/1
  # GET /books/1.json
  def show
    # @book = Book.find(params[;id])
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.title = session[:user_id]
    session[:user_id] = nil
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    # ユーザーが入力した値(book_params)をもとにBookインスタンスを作成
    @book = Book.new(book_params)
    
    # 書籍テーブルに登録
    respond_to do |format|
      # データベースに保存
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update

    # 書籍テーブルを更新
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      # params:リクエスト内からIDという名前のパラメータを取得する
      # findメソッドはIDが一致するBookを1件取得する
      # つまり、Bookに関係ないパラメータは無視する仕組み
      params.require(:book).permit(:title, :price)
    end
end
