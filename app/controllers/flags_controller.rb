class FlagsController < ApplicationController
  def index
    @title = "第一のフラッグを探せ"
    @hint = "ページのソースを表示"
  end

  def show
    case params[:id]
    when "2"
      @title = "Stage002"
      render "flags/stage002"
    else
      @title = "Error"
      render "flags/index"
    end
  end
end
