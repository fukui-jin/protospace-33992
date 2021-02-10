class UsersController < ApplicationController

  def show
    @user = current_user.name
    @prototypes = current_user.prototypes
  end
end
