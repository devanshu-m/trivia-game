class PagesController < ApplicationController

	def index
	end

	def score
  		@user = User.all.order('score DESC')
	end
end
