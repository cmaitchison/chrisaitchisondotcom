module TwitterHelper

  def twitter_button
    link_to "Tweet", "http://twitter.com/share", :class => 'twitter-share-button', "data-count" => "horizontal", "data-via" => "cmaitchison", :url=>"http://chrisaitchison.com/fdg.html"
  end
  
  def twitter_button_script
    javascript_include_tag "http://platform.twitter.com/widgets.js"
  end
  
  def follow_me_on_twitter
    link_to image_tag("http://twitter-badges.s3.amazonaws.com/follow_me-c.png", :alt => "Follow cmaitchison on Twitter"), "http://www.twitter.com/cmaitchison", :target => "_blank"
  end
  
  def display_twitter_feed
    a = javascript_include_tag "http://widgets.twimg.com/j/2/widget.js"
    b = javascript_tag """
    new TWTR.Widget({
        version: 2,
        type: 'profile',
        rpp: 5,
        interval: 6000,
        width: 250,
        height: 300,
        theme: {
          shell: {
            background: '#ffffff',
            color: '#000051'
          },
          tweets: {
            background: '#ffffff',
            color: '#000000',
            links: '#000051'
          }
        },
        features: {
          scrollbar: false,
          loop: true,
          live: false,
          hashtags: true,
          timestamp: true,
          avatars: true,
          behavior: 'default'
        }
      }).render().setUser('cmaitchison').start();
    """
    a+b
  end
end

