module Urls
  class StatsService < BaseService
    def call
      url_record = Url.find_by(short_url: params.require(:short_url))
      if url_record.present?
        {data: url_record.clicks_counter, status: 200}
      else
        {data: 'not_found', status: 404}
      end
    rescue StandardError => e
      {data: e.message, status: 422}
    end
  end
end