class ExamplesController < ApplicationController

# before_filter :authenticate

def index
	@examples = get_examples
end

# protected

def authenticate
	if Rails.env.production?
	  authenticate_or_request_with_http_basic do |username, password|
	    username == ENV['USERNAME'] && password == ENV['PASSWORD']
	  end
	end
end

private
	def get_examples
		Dir.open(Rails.root + 'public').select {|filename|
			filename.match(/^^[\D\.].*\.html/)
		}
	end
end