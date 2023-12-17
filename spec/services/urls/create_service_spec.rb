require 'rails_helper'

RSpec.describe Urls::CreateService do
  describe '#call' do
    subject { described_class.call(ActionController::Parameters.new(params)) }
    let(:url_1) { 'https://www.site.com/pages/page-one' }
    let(:url_2) { 'https://www.site.com/pages/page-two' }
    let(:short_url_1) { Digest::MD5.hexdigest(url_1)[0..10] }
    let(:params) { {url: url_1} }
    context '' do
      let(:params) { {url: nil} }
      it 'returns failure result' do
        expect { subject }.not_to change(Url, :count)
        expect(subject[:status]).to eq(422)
      end
    end

    context 'create non-unique url' do
      it 'returns existing short_url without creating' do
        Url.create!(url: url_1)
        expect { subject }.not_to change(Url, :count)
        expect(subject[:status]).to eq(200)
        expect(subject[:data]).to eq(short_url_1)
      end
    end

    context 'call unique url' do
      it 'returns new unique short_url' do
        first_url = Url.create!(url: url_2)
        expect { subject }.to change(Url, :count).by(1)
        expect(subject[:status]).to eq(200)
        expect(subject[:data]).not_to eq(first_url.short_url)
      end
    end
  end
end