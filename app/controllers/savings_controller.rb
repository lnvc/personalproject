class SavingsController < ApplicationController
before_action :authenticate_user!
  def index
  	@query = Saving.where("month == ?", Date.today.month).where("month == ?", Date.today.year)
  	if @query.exists?
	# @all = 0
	# Saving.all.each do |s|
	# 	@all += s.currvalue 
	# end
	@query.currvalue += Saving.where("month == ?", Date.today.month-1).where("month == ?", Date.today.year).first.currvalue
	# @accumulated = Saving.where("month == ?", Date.today.month).currvalue
	else
		@accumulated = Saving.new
		@accumulated.currvalue += Saving.where("month == ?", Date.today.month).where("month == ?", Date.today.year).all.currvalue if Saving.where("month == ?", Date.today.month).where("month == ?", Date.today.year).first != nil
	end

  end

  def new
  end
  def create
  	@saving = Saving.new(saving_params)
  	if @saving.save
  		redirect_to savings_index_path, notice: "added money"
  	end
  end

  def edit
  end
  private
  	def saving_params
  		params.require(:saving).permit!
  	end
end
