module FacebookHelper
  def facebook_like_button  
    tag "iframe", {:src => "http://www.facebook.com/plugins/like.php?href=http://chrisaitchison.com",:scrolling => "no", :frameborder => "0",:style=>"border:none; width:250px; height:400px"}
  end
end    