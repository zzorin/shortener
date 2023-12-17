module Urls
  class CreateService < BaseService
    def call
      url_record = Url.find_or_create_by!(url: params.require(:url))

      {data: url_record.short_url, status: 200}
    rescue StandardError => e
      {data: e.message, status: 422}
    end
  end
end