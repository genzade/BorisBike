require 'bike'

describe Bike do
  subject(:bike) { described_class.new }

  describe '#broken?' do
    it { is_expected.to respond_to :broken? }
  end

  describe '#report_broken' do
    it { is_expected.to respond_to :report_broken }

    it 'will allow a bike to be reported broken' do
      bike.report_broken
      expect(bike).to be_broken
    end
  end
end