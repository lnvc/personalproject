class HomesController < ApplicationController
	before_action :authenticate_user!
	def index
		@tasks = Task.all.where(:status=>true)
	end
	private
		def task_params
			params.require(:task).permit!
		end
end
