require 'rails_helper'

RSpec.describe Urls::ShowService do
  describe '#call' do
    subject { described_class.call(ActionController::Parameters.new(params)) }
    let(:url) { 'https://www.site.com/pages/page-one' }
    let(:short_url) { Digest::MD5.hexdigest(url)[0..10] }
    let(:params) { {short_url: short_url} }
    context 'call existing url' do
      it 'returns url, increase counter' do
        url_record = Url.create!(url: url)
        expect(subject[:status]).to eq(200)
        expect(subject[:data]).to eq(url)
        expect(url_record.reload.clicks_counter).to eq(1)
      end
    end

    context 'call non-existing url' do
      it 'returns 404' do
        expect(subject[:status]).to eq(404)
      end
    end
  end
end