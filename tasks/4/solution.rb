RSpec.describe 'Version' do
  describe '#initialization' do
    it 'raise_error' do
      expect { Version.new('32..d') }.to raise_error(ArgumentError)
    end
    it 'should not raise error' do
      expect { Version.new('3.1.2') }.to_not raise_error
    end
  end
  describe '#<=>' do
    it "v1<v2 is true when v1<v2" do
      v1 = Version.new('2.3.2')
      v2 = Version.new('3.2.2')
      expect(v1 < v2).to be true
    end
    it "v1<v2 is false when v1>=v2" do
      v1 = Version.new('3.3.2')
      v2 = Version.new('2.2.2')
      expect(v1 < v2).to be false
    end
    it "v1>v2 is true when v1>v2" do
      v1 = Version.new('3.3.2')
      v2 = Version.new('2.2.2')
      expect(v1 > v2).to be true
    end
    it "v1>v2 is false when v1<=v2" do
      v1 = Version.new('2.3.2')
      v2 = Version.new('3.2.2')
      expect(v1 > v2).to be false
    end

    it "v1 == v2 is true when v1 == v2" do
      v1 = Version.new('2.3.2')
      v2 = Version.new('2.3.2')
      expect(v1 == v2).to be true
    end
    it "v1 == v2 is false when v1 != v2" do
      v1 = Version.new('2.3.2')
      v2 = Version.new('3.2.2')
      expect(v1 == v2).to be false
    end
    it "v1!=v2 is true when v1!=v2" do
      v1 = Version.new('3.3.2')
      v2 = Version.new('2.2.2')
      expect(v1 != v2).to be true
    end
    it "v1!=v2 is false when v1 == v2" do
      v1 = Version.new('2.3.2')
      v2 = Version.new('2.3.2')
      expect(v1 != v2).to be false
    end
  end

  describe '#to_s' do
    it 'return good string' do
      expect(Version.new('4.5.2').to_s).to eq '4.5.2'
    end
  end

  describe '#components' do
    it "return good array when called without argument" do
      expect(Version.new('4.5.7').components).to eq [4, 5, 7]
    end
    it "return good array when called without argument and 
    last component is 0" do
      expect(Version.new('0.4.0').components).to eq [0, 4]
    end
    it "return good array when called with argument" do
      expect(Version.new('2.4.1').components(2)).to eq [2, 4]
    end
    it 'return good array when called with argument 1 and
    second component is 0' do
      expect(Version.new('4.0.0').components(1)).to eq [4]
    end
  end
end

RSpec.describe "Version::Range" do
  describe '#include?' do
    before do
      @range = Version::Range.new('1.3.2', '4.2.3')
    end
    it 'return true with good argument' do
      expect(@range.include?('3.3.2')).to be true
    end
    it 'return false with argument < start_version' do
      expect(@range.include?('0.2.3')).to be false
    end
    it 'return false with argument > end_version' do
      expect(@range.include?('5.2.3')).to be false
    end
    it 'return true when argument == start_version' do
      expect(@range.include?('1.3.2')).to be true
    end
    it 'return false when argument == end_version' do
      expect(@range.include?(Version.new('4.2.3'))).to be false
    end
  end
  describe '#to_a' do
    it 'return good array' do
      expect(Version::Range.new('1.9.7', '2.0.1').to_a)
              .to eq ['1.9.7', '1.9.8', '1.9.9', '2']
    end
    it 'return empty array when start_version>end_version' do
      expect(Version::Range.new('2.9.7', '2.0.1').to_a).to eq []
    end
  end
end