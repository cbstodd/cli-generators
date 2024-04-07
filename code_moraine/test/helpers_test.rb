require 'minitest/autorun'
require_relative '../lib/helpers'

# class HelpersTest < Minitest::Test
#   def print_cta_prints_message_paramater
#     assert_includes('Hello World', print_cta('Hello World'))
#   end

#   def create_file_actually_creates_a_file
#     assert_equal(true, create_file('test', 'md', 'If you see this, create_file() works.'))
#     assert_includes('If you see this, create_file() works.', File.read('test.md'))
#   end
# end

describe 'Project Helpers' do
  it 'print_cta_prints_message_paramater' do
    class TestMsg
      include_relative '../lib/helpers.rb'
      def saysomething
        print_cta('Say Something')
      end
    end

    msg_obj = TestMsg.new

    _(msg_obj.saysomething).must_equal 'Say Something'
  end
end
