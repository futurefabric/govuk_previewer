class ExamplesController < ApplicationController
	def index
		@examples = get_examples
	end

private
	def get_examples
		Dir.open(Rails.root + 'public').select {|filename|
			filename.match(/^^[\D\.].*\.html/)
		}
	end
end