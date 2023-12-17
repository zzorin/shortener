class UrlsController < ApplicationController
  def create
    result = ::Urls::CreateService.call params

    render json: result[:data], status: result[:status]
  end

  def show
    result = ::Urls::ShowService.call params

    render json: result[:data], status: result[:status]
  end

  def stats
    result = ::Urls::StatsService.call params

    render json: result[:data], status: result[:status]
  end
end
