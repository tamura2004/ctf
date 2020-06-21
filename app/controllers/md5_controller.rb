require "digest/md5"

class Md5Controller < ApplicationController
  def index
  end

  def show
    @title = "ハッシュ変換"
    @hint = "MD5関数"
    @key = params[:key]
    @hash = Digest::MD5.hexdigest(@key)
    render "md5/show"
  end
end
