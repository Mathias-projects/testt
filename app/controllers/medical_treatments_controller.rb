class MedicalTreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :MedicalTreatmentsController, only: [:update, :create, :destroy]


  def index
    @medical_treatments = MedicalTreatment.all;
    json_response(@medical_treatments, :ok)
  end

  def create
    if Doctor.find(current_user.id)
      @medical_treatment = current_user.build_medical_treatment(medical_treatment_params)
      if @medical_treatment.save
        json_response({"detail": "treatment created"}, :ok)
      else
        json_response({"detail": "something is wrong with request"}, :bad_request)
      end
    else
      json_response({"detail": "Only doctor can add new medical treatment!"}, :forbidden)
    end
  end


  # def update
  #   if @working_hours_table.update(working_hours_table_params)
  #     json_response({"detail": "working hours table has been upgraded"}, :ok)
  #   else
  #     json_response({"detail": "something went wrong"}, :bad_request)
  #   end
  # end
  #
  # def destroy
  #   @working_hours_table.destroy
  #   json_response("deleted", :ok)
  # end

  private
  def medical_treatment_params
    params.require(:working_hours).permit(:name, :date, :start_time, :end_time, :user_id, :patient_id)
  end

end
