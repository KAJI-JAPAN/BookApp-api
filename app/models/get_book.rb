require "net/http"

class GetBook < ApplicationRecord
  def self.search(params)
    user_keyword = URI.encode_www_form_component(params)
    uri= URI.parse("https://www.googleapis.com/books/v1/volumes?q=#{user_keyword}&maxResults=15")
    response = Net::HTTP.get_response(uri)
    response_book = JSON.parse(response.body)

    return response_book
  end
end
