# coding: utf-8
require 'open-uri'
require 'json'
require 'ostruct'

class ImageSearch

  def self.search(options={})
    query = "http://ajax.googleapis.com/ajax/services/search/images?"
    first = true
    options.each do |key, option|
      if first then
        query << "#{key}=#{option}"
        first = false
      else
        query << "&#{key}=#{option}"
      end
    end
    json = open(query).read()
    hash = JSON.parse(json)
    OpenStruct.new(hash["responseData"]["results"])
  end
end
