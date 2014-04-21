class Store < ActiveRecord::Base

	def open_times
		{"Sun" => sun, "Mon" => mon, "Tus" => tus, "Wed" => wed, "Thr" => thr, "Fri" => fri, "Sat" => sat}
	end
end
