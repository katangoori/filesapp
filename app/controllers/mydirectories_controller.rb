class MydirectoriesController < ApplicationController

  # GET /mydirectories
  # GET /mydirectories.json
  def index
    dir = (params[:path] ? params[:path] : "/")
    @mydirectories = Mydirectory.all(dir)
  end


  # POST /mydirectories
  # POST /mydirectories.json
  def create
	mydirectory = Mydirectory.new(mydirectory_params)
	mydirectory.save
    redirect_to "/mydirectories?path=#{mydirectory.path+"/"+mydirectory.name}", notice: 'Mydirectory was successfully created.'
  end


  # DELETE /mydirectories/1
  # DELETE /mydirectories/1.json
  def destroy
	mydirectory = Mydirectory.new(mydirectory_params)
    mydirectory.destroy
    redirect_to "/mydirectories?path=#{mydirectory.path}", notice: 'Mydirectory was successfully created.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def mydirectory_params
      params.permit(:name, :path)
    end
end
