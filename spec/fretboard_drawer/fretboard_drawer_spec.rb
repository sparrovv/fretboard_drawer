require 'spec_helper'

describe FretboardDrawer do

  let(:sounds) { {} }
  let(:result) { "-----" }

  describe ".draw" do
    before do
      FretboardDrawer::Fretboard.any_instance.
        should_receive(:result).and_return(result)
    end

    it "draws to sdtout" do
      $stdout.should_receive(:puts).with(result).and_return(true)

      FretboardDrawer.draw
    end
  end

  describe ".reload" do
    it "reloads Fretboard instance and use proper config values" do
      FretboardDrawer.reload

      FretboardDrawer::Config.number_of_strings = 4
      FretboardDrawer.fretboard.strings.should == 4

      FretboardDrawer::Config.number_of_strings = 5
      FretboardDrawer.fretboard.strings.should == 4

      FretboardDrawer.reload

      FretboardDrawer.fretboard.strings.should == 5
    end
  end

  describe "Config" do
    it "sets number of strings" do
      FretboardDrawer::Config.number_of_strings = 4
      FretboardDrawer::Config.number_of_strings.should == 4
    end

    it "sets number of frets" do
      FretboardDrawer::Config.number_of_frets = 13
      FretboardDrawer::Config.number_of_frets.should == 13
    end
  end
end
