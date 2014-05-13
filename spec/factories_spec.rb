describe 'Factories' do
  FactoryGirl.factories.map(&:name).each do |factory_name|
    describe "The #{factory_name} factory" do
      it 'is valid' do
        if (factory_name.to_s.include? 'invalid_')
          build(factory_name).should be_invalid
        else
          build(factory_name).should be_valid
        end
      end
    end
  end
end