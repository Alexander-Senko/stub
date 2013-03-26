# Stub

Proxy objects with fallbacks.
Useful for creating stubs with partially defined objects.


## Installation

Add this line to your application's Gemfile:

    gem 'stub'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stub


## Usage

Inherit `Stub::Abstract` (or `Stub::Template::Abstract`) and define `__stub__`
method:

	class MyStub < Stub::Abstract
		module Methods
			def __stub__ method_name, *args, &block
				# Do something when method fails on the proxied object
				# or returns nil.
			end
		end
	end

See also `Stub::Template::Prototype` as a working example.

### `Stub::Template::Prototype`

Use a proxied object to generate placeholders in place of _absent_ attributes &
methods:

	render Stub::Template::Prototype.new(MyModel.new)

Later you can use this `render`ed template in Prototype's `new Template()` and
`evaluate` it with data from `MyModel.find`. Example (don't forget escaping in
real-life code):

	var template = '<%= render Stub::Template::Prototype.new(MyModel.new) %>';
	var record   = JSON.parse('<%= my_model.to_json %>');

	text = new Template(template).evaluate(record);


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
