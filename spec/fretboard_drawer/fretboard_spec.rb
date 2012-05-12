require 'spec_helper'

describe FretboardDrawer::Fretboard do

  let(:strings_number) { 6 }
  let(:frets_number) { 20 }

  subject { FretboardDrawer::Fretboard.new(strings_number, frets_number) }

  describe "#result" do
    context "when no sounds to draw" do
      let(:frets_number) { 10 }

      it "returns string" do
        expected = "                3           5           7           9         \n"
        expected << "e|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "b|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "g|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "d|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "a|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "e|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"

        subject.result.should == expected
      end
    end

    context "when there are sounds to draw" do
      let(:frets_number) { 10 }
      let(:sounds) do
        { 1 => { 2 => "f#", 9 => "c#"}, 6 => { 1 => "f" } }
      end

      it "returns string" do
        expected = "                3           5           7           9         \n"
        expected << "e|-----|-f#--|-----|-----|-----|-----|-----|-----|-c#--|-----|\n"
        expected << "b|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "g|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "d|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "a|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"
        expected << "e|--f--|-----|-----|-----|-----|-----|-----|-----|-----|-----|\n"

        subject.result(sounds).should == expected
      end
    end
  end

  describe "#strings_structure" do
    context "when no sounds" do
      let(:sounds) { {} }
      it "generates strings structure" do
        structure = subject.strings_structure(sounds)
        structure.size.should == strings_number
      end
    end
  end

end
