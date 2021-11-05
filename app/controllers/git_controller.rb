class GitController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @params = {
      :query => params[:query]
    }

    @rep = URI("https://api.github.com/users/#{params[:query]}/repos")
    @rep.query = URI.encode_www_form(@params)
    @rep_json = Net::HTTP.get(@rep)
    @api_response = JSON.parse(@rep_json)

    @name = URI("https://api.github.com/users/#{params[:query]}")
    @name.query = URI.encode_www_form(@params)
    @name_json = Net::HTTP.get(@name)
    @name_response = JSON.parse(@name_json)
    if @name_response["name"].present?
      @name_of_git = @name_response["name"]
    else
      @name_of_git = "There is no such name"
    end
    @repos = []
    @api_response.each do |a|
      a.each do |name,repository|
        if name == 'name'
          repos = "- #{repository}"
          @repos << repos
        end
      end
    end
  end
end
