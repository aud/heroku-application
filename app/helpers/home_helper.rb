module HomeHelper
	def logging
	  @logs = `tail -n 25 log/#{Rails.env}.log`.split(/\n/)
		render text: @logs
	end
end
