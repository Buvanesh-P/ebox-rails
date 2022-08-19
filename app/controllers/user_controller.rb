class UserController < ApplicationController
  def index
    @userinfos = Userinfo.find_by(users_id: current_user.id)
  end

  def edit
    @userdata = Userinfo.find_by(users_id: current_user.id)
    render :edit
  end

  def update
    user_data = Userinfo.find_by(users_id: current_user.id)
    if user_data.nil?
      user_info = Userinfo.new(new_params)
      if user_info.save
        redirect_to user_index_path, notice: "You account info updated"
      end
    else
      if user_data.update(user_params)
        redirect_to user_index_path, notice: "You account info updated"
      end
    end
  end


  private
  def user_params
    params.require(:userinfo).permit(:fullname,:address,:city,:designation,:phone,:doj,:dob,:blood_group,:department,:emergency_number,:emp_id,:users_id,:profile)
  end
  def new_params
    params.permit(:fullname,:address,:city,:designation,:phone,:doj,:dob,:blood_group,:department,:emergency_number,:emp_id,:users_id,:profile)
  end
end
