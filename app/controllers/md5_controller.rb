require "digest/md5"

class Md5Controller < ApplicationController
  def index
  end

  def show
    @hash = Digest::MD5.hexdigest(params[:key])
    render "md5/show"
  end
end
