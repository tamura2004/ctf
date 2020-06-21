require "digest/md5"

class FlagsController < ApplicationController
  def index
    @title = "第一のフラッグを探せ"
    @hint = "ページのソースを表示"
  end

  def show
    @id = params[:id]
    @hash = Digest::MD5.hexdigest(@id)

    if @id == Digest::MD5.hexdigest("wood")
      @title = "第二のフラッグを探せ"
      @hint = "クッキー"
      session[:flag] = "Flag002{0a840ef45467fb3932dbf2c2896c5cbf}" # stone
      render "flags/stage001"
    elsif @id == Digest::MD5.hexdigest("stone")
      @title = "第三のフラッグを探せ"
      @hint = "httpヘッダー"
      response.set_header('X-FLAGS', 'Flag003{bcd31c714bca2c41ffca31bd03003311}') # iron
      render "flags/stage002"
    else
      @title = "キーワードエラー"
      @hint = @id
      render "flags/error"
    end
  end
end
