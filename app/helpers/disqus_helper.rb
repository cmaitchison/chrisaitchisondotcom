module DisqusHelper
  
  def show_thread_for post
    """
      var disqus_shortname = '#{enki_config[:disqus_name]}';
      var disqus_identifier = 'post_id_#{post.id}';
      var disqus_url = '#{"http://" + enki_config[:disqus_url] + post_path(post)}';
      var disqus_title = '#{post.title}';
      
      (function() {
      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
      dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
    """
  end
  def show_comment_counts
    """
      var disqus_shortname = '#{enki_config[:disqus_name]}';
      
      (function() {
         var s = document.createElement('script'); s.async = true;
         s.type = 'text/javascript';
         s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
         (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
      })();
    """
  end
end