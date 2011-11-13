require File.expand_path('spec/spec_helper')

describe String do
  it 'should camelize' do
    "has_lyrics".camelize.should == "HasLyrics"
    "has_lyrics".camelize(:lower).should == "hasLyrics"
    "multiple_underscores_here".camelize.should == "MultipleUnderscoresHere"
    "multiple_underscores_here".camelize(:lower).should == "multipleUnderscoresHere"
  end
end
