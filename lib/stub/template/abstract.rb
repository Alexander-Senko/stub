require 'stub/abstract'

module Stub::Template
	class Abstract < Stub::Abstract
		def initialize resource, call_chain = nil
			@call_chain = call_chain

			super resource
		end

		module Methods
			def __wrap__ object, method_name, *args
				@stub_class.new object, __call_chain__(method_name)
			end

			def __stub__ method_name, *args
				"\#{#{__call_chain__ method_name}}"
			end

			def __call_chain__ method_name
				[@call_chain, method_name].compact * '.'
			end
		end
	end
end
