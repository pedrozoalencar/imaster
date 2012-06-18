module AsksHelper
	def author(ask)
		unless ask.applied_roles[0].nil?
		ask.applied_roles[0].users[0]
		end
	end
end
