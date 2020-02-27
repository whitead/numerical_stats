{% extends 'slides_reveal.tpl'%}
{% block post_slides %}
<style>
{% include 'custom.css' %}
</style>
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
        Reveal.initialize({
            controls: false,
            progress: true,
            // The "normal" size of the presentation, aspect ratio will be preserved
            // when the presentation is scaled to fit different resolutions. Can be
            // specified using percentage units.
            width: 960,
            height: 700,

            // Factor of the display size that should remain empty around the content
            margin: 0.1,
			keyboard: {
    			39: 'next',
    			37: 'prev'
  			},
            // Bounds for smallest/largest possible scale to apply to content
            minScale: 0.2,
            maxScale: 1.5,
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
    }
);
</script>

</body>
{% endblock post_slides %}