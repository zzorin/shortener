module Urls
  class ShowService < BaseService
    def call
      url_record = Url.find_by(short_url: params.require(:short_url))
      if url_record.present?
        url_record.update!(clicks_counter: url_record.clicks_counter + 1)
        {data: url_record.url, status: 200}
      else
        {data: 'not_found', status: 404}
      end
    rescue StandardError => e
      {data: e.message, status: 422}
    end
  end
end