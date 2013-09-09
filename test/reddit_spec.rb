require 'minitest/autorun'

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/..')

require './Reddit.rb'

describe 'Reddit' do
  before do
    @me = Reddit.new('reddit')
  end

  it 'should have a username' do
    @me.username.must_equal 'reddit'
  end

  it 'should have JSON data' do
    @me.data = JSON.parse(File.new('./test/test_data.json').read)
    @me.data.class.must_equal Hash
  end

  it 'should have some link karma' do
    @me.link_karma.must_equal 35580
  end

  it 'should have some comment karma' do
    @me.comment_karma.must_equal 816
  end

  it 'should not have mail' do
    @me.has_mail.must_equal false
  end

  it 'should not have mod mail' do
    @me.has_mod_mail.must_equal false
  end

  it 'should have reddit gold' do
    @me.is_gold.must_equal true
  end

  it 'should not be my friend' do
    @me.is_friend.must_equal false
  end

  it 'should not be over 18' do
    @me.over_18.must_equal false
  end

  it 'should have a time object for cake day' do
    @me.cake_day.class.must_equal time
  end

  it 'should output in the correct format' do
    @me.to_s.must_equal 'Reddit: reddit 35580:816'
  end
end