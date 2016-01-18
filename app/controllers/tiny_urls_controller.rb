class TinyUrlsController < ApplicationController
  def index
#    TinyUrl.delete_all
  end
  
  def create
    @tinyUrl = TinyUrl.new
    @tinyUrl.url = params[:url]
    @tinyUrl.shorten_key = rand(36**8).to_s(36)
    @tinyUrl.save
    
    respond_to do |format|
      format.html {redirect_to @tinyUrl}
    end
  end
  
  def show
    @tinyUrl = TinyUrl.find(params[:id])
  end
  
  def destroy
    TinyUrl.delete_all(:conditions => { _id: BSON::ObjectId(params[:id])})
  end
  
  def get_url
    tinyUrl = TinyUrl.where(:shorten_key => params[:id]).first
    unless tinyUrl.nil?
      redirect_to(tinyUrl.url) 
    else
      redirect_to(root_path) 
    end
  end
  
end
