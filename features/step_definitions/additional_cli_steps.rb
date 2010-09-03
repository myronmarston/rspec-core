Then /^the output should contain all of these:$/ do |table|
  table.raw.flatten.each do |string|
    assert_partial_output(string)
  end
end

Then /^the output should not contain any of these:$/ do |table|
  table.raw.flatten.each do |string|
    combined_output.should_not =~ compile_and_escape(string)
  end
end

Then /^the backtrace\-normalized output should contain:$/ do |partial_output|
  # ruby 1.9 includes additional stuff in the backtrace,
  # so we need to normalize it to compare it with our expected output.
  normalized_output = combined_output.split("\n").map do |line|
    line =~ /(^\s+# [^:]+:\d+)/ ? $1 : line # http://rubular.com/r/zDD7DdWyzF
  end.join("\n")

  normalized_output.should =~ compile_and_escape(partial_output)
end

