class AcceptancesController < ApplicationController
  def new
    # フィールドに代入したオブジェクトをViewに渡すことができる
    # 空のAcceptanceオブジェクトを渡すことができる
    @acceptance = Acceptance.new
  end

  def create
    # ユーザーの入力値を元に
    @acceptance = Acceptance.new(acceptance_params)

    # validationチェック
    if @acceptance.valid?
      puts "承認されました！"
      redirect_to books_path
    else
      render :new
    end
  end

  private
  def acceptance_params
    # ユーザーの入力値を受け取る(params)
    # paramsには何が入って来るかわからず危険→
    # require :acceptanceオブジェクトのacceptingフィールド以外の値は消去
    params.require(:acceptance).permit(:accepting)
  end
end
