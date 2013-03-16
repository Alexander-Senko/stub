module Stub
	class Abstract
		def self.inherited subclass
			eval <<-RUBY
				module #{subclass}::Methods
					include #{self}::Methods
				end
			RUBY
		end

		def initialize object
			@object     = object
			@stub_class = self.class

			singleton_class = self.singleton_class

			methods.each &singleton_class.method(:undef_method)
			singleton_class.send :include, @stub_class.const_get(:Methods)
		end

		module Methods
			def method_missing method_name, *args, &block
				result = @object.send method_name, *args, &block

				case result
				when nil
					raise
				when true, false, String, Numeric, Array, Hash
					result
				else
					__wrap__ result, method_name, *args, &block
				end
			rescue
				__stub__ method_name, *args, &block
			end

			def __wrap__ object, *context
				@stub_class.new object
			end
		end
	end
end
