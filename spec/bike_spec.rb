require 'bike'

# As a person,
# So that I can use a good bike,
# I'd like to see if a bike is working

describe Bike do
  subject(:bike) { described_class.new }

  describe '#working?' do
    it { is_expected.to respond_to :working? }
  end
end