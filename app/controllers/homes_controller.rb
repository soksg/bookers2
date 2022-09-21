class HomesController < ApplicationController
  def top
  end


def create
　　@user = login(params[:email], params[:password])
　　if @user
 　　　redirect_back_or_to root_path, success: t('.create.success')
　　else
　　　　flash.now[:danger] = t('.create.fail')
 　　　render :new
　　end
  end
end
