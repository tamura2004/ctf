require "digest/md5"

class FlagsController < ApplicationController
  def index
    @title = "第一のフラッグを探せ"
    @hint = "ページのソースを表示"
  end

  def show
    @id = params[:id]

    if @id == to_hash("wood")
      @title = "第二のフラッグを探せ"
      @hint = "クッキー"
      cookies[:flag002] = to_flag(2, "stone")
      render "flags/stage001"

    elsif @id == to_hash("stone")
      @title = "第三のフラッグを探せ"
      @hint = "httpヘッダー"
      response.set_header('X-FLAGS', to_flag(3, "iron"))
      render "flags/stage002"

    elsif @id == to_hash("iron")
      @title = "第四のフラッグを探せ"
      @hint = "cssのcontent属性"
      @flag = to_flag(4, "copper")
      render "flags/stage003"

    elsif @id == to_hash("copper")
      @title = "第五のフラッグを探せ"
      @hint = "コンソールからjavascript関数getTheFlag()を実行" 
      render "flags/stage004"

    elsif @id == getTheFlag()
      @title = "第六のフラッグを探せ"
      @hint = "SSL証明書のシリアル番号"
      render "flags/stage005"

    elsif @id == "0d815852151a1a5a24965765c165742d"
      @title = "第七のフラッグを探せ"
      @hint = "/dev/md5/silverでハッシュ値を取得"
      render "flags/stage006"
  
    elsif @id == to_hash("silver")
      @title = "第八のフラッグを探せ"
      @hint = "md5ハッシュ値が#{to_hash('aqws')}である英子文字4文字"
      render "flags/stage007"

    elsif @id == "aqws"
      @title = "第九のフラッグを探せ"
      @hint = "２、３、４のキーの排他的論理和"
      @flag = getFlag009()
      render "flags/stage008"
      
    elsif @id == getFlag009()
      @title = "最後のフラッグを探せ"
      @hint = "githubで講師のリポジトリからctfを探し、app>controllers>flags_controller.rbを見る"
      render "flags/stage009"
      
    elsif @id == getFlagFinal()
      @title = "全てのフラッグを集めた！"
      @hint = "おめでとう。今度はgithubでfolkして自分の問題サーバを作ってみよう。"
      render "flags/stagefinal"
      
    else
      @title = "キーワードエラー"
      @hint = @id
      render "flags/error"
    end
  end
  
  def create
    @id = params[:flag]
    if @id == "7"
      render plain: to_hash("7")
      
    else
      @title = "キーワードエラー"
      @hint = @id
      render "flags/error"
    end
  end
  
  private
  
  def to_hash(key)
    Digest::MD5.hexdigest(key)
  end
  
  def to_flag(n, key)
    sprintf("Flag%03d{%s}", n, to_hash(key))
  end

  def getTheFlag()
    32.times.map{ (_1 * 23 % 26 + 97).chr }.join
  end
  
  def getFlag009()
    %w(stone iron copper).map{|v| to_hash(v)}.map{|v|v.to_i(16)}.inject(:^).to_s(16)
  end

  def getFlagFinal()
    "thequickbrownfoxjumpsoverthelazydog"
  end
end
