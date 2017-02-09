{% extends 'slides_reveal.tpl'%}
{% block post_slides %}
<script>
require(
    {
      // it makes sense to wait a little bit when you are loading
      // reveal from a cdn in a slow connection environment
      waitSeconds: 15
    },
    [
      "{{resources.reveal.url_prefix}}/lib/js/head.min.js",
      "{{resources.reveal.url_prefix}}/js/reveal.js"
    ],
    function(head, Reveal){
        // Full list of configuration options available here: https://github.com/hakimel/reveal.js#configuration
		
		//$('section:first').attr('data-background','background.jpg')
        Reveal.initialize({
            controls: false,
            progress: true,
			slideNumber: 'c / t',
            history: true,
            theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
            transition: 'convex',
			backgroundTransition: 'fade',
            // Optional libraries used to extend on reveal.js
            dependencies: [
                { src: "{{resources.reveal.url_prefix}}/lib/js/classList.js",
                  condition: function() { return !document.body.classList; } },
                { src: "{{resources.reveal.url_prefix}}/plugin/notes/notes.js",
                  async: true,
                  condition: function() { return !!document.body.classList; } }
            ]
        });
        var update = function(event){
          if(MathJax.Hub.getAllJax(Reveal.getCurrentSlide())){
            MathJax.Hub.Rerender(Reveal.getCurrentSlide());
          }
        };
        Reveal.addEventListener('slidechanged', update);
        var update_scroll = function(event){
          $(".reveal").scrollTop(0);
        };
        Reveal.addEventListener('slidechanged', update_scroll);
	
    }
);
</script>

</body>
{% endblock post_slides %}