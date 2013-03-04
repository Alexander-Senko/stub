require 'stub/template/abstract'

module Stub::Template
	class Prototype < Abstract
		module Methods
			def __stub__ method_name, *args
				"\#{#{__call_chain__ method_name}}"
			end
		end
	end
end
