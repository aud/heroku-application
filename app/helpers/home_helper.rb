module HomeHelper
	def logging
		if Rails.env == 'production'
		  @logs = `tail -n 25 log/production.log`.split(/\n/)
			render text: @logs
		else
			@logs = `tail -n 50 log/development.log`.split(/\n/)
			render text: @logs
		end
	end
end
