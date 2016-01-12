class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes_from(station)
    station.collect_broken.each do |bike|
      @bikes << bike
    end
  end

  def deliver_bikes_to(garage)
    if bikes.all? {|bike| bike.broken == true}
      garage.receive_working_bikes(bikes)
    else
      garage.receive_broken_bikes(bikes)
    end
    bikes.clear
  end
end

# subject(:van) {described_class.new}
#   let(:dock_stat) {double(:dock_stat) }
#   let(:garage) {double(:garage)}
#   let(:bike) {double(:bike, :working => false)}

#   before do
#     allow(dock_stat).to receive(:collect_broken_bikes).and_return([bike])
#     allow(garage).to receive(:receive_broken_bikes).and_return([bike])
#     allow(garage).to receive(:release_working_bikes).and_return([bike])
#     van.pick_up_broken_bikes(dock_stat)
#   end

# describe '#deliver' do

#     it 'calls receive_broken_bikes on the garage' do
#       van.deliver(garage)
#       expect(garage).to have_received(:receive_broken_bikes)
#     end
#     it 'clears the van of bikes' do
#       van.deliver(garage)
#       expect(van.bikes).to be_empty
#     end

#   end