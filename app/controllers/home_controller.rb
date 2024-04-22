class HomeController < ApplicationController
  before_action :must_login

  def index
    @accounts = Account.paginate(:page => params[:page], per_page: 5)
    @networks = Network.paginate(:page => params[:page], per_page: 5)
    @schools = School.paginate(:page => params[:page], per_page: 5)
    @usertypes = Usertype.paginate(:page => params[:page], per_page: 5)
    @users = User.paginate(:page => params[:page], per_page: 5)
  end
end
