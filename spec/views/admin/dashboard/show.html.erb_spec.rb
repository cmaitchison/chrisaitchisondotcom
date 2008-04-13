require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/dashboard/show.html.erb" do
  after(:each) do
    response.should be_valid_xhtml_fragment
  end

  it 'should render' do
    assigns[:posts] = [mock_model(Post)]
    assigns[:comment_activity] = [mock("comment-activity-1",
      :post                => mock_model(Post, 
        :published_at      => Time.now,
        :title             => "A Post",
        :slug              => 'a-post',
        :approved_comments => []
      ),
      :comments            => [mock_model(Comment, :author => 'Don', :body_html => 'Hello')],
      :most_recent_comment => mock_model(Comment, :created_at => Time.now, :author => 'Don')
    )]
    render '/admin/dashboard/show.html.erb'
  end
end