class WorkingHoursTablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_working_hours_table, only: [:update, :create, :destroy]


  def index
    @working_hours_tables = WorkingHoursTable.all;
    json_response(@working_hours_tables, :ok)
  end

  def create
    p @working_hours_table
    if @working_hours_table
      json_response({"detail": "table already created for this user"}, :forbidden)
    else
      @working_hours_table = current_user.build_working_hours_table(working_hours_table_params)
      if @working_hours_table.save
        json_response({"detail": "table created"}, :ok)
      else
        json_response({"detail": "something is wrong with request"}, :bad_request)
    end
    end
  end


  def update
    if @working_hours_table.update(working_hours_table_params)
      json_response({"detail": "working hours table has been upgraded"}, :ok)
    else
      json_response({"detail": "something went wrong"}, :bad_request)
    end
  end

  def destroy
    @working_hours_table.destroy
    json_response("deleted", :ok)
  end

  private
  def working_hours_table_params
    params.require(:working_hours).permit(:monday, :tuesday, :wednesday, :thursday, :friday, :user_id)
  end

  def set_working_hours_table
    @working_hours_table = current_user.working_hours_table
  end
end
