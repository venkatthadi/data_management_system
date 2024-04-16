class HomeController < ApplicationController
  def index
    @accounts = Account.all
    @networks = Network.all
    @schools = School.all
    @usertypes = Usertype.all
    @users = User.all
  end
end
