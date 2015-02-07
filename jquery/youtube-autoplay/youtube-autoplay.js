(function($) {

  var PLUGIN_NAME = 'youTubePlayer',
      instanceDefaultOptions = {},
      instances = [],
      hasLoadedYoutubeApi = false;

  var globalApi = {
      instances: instances
  };

  function pluginInstance(el, options) {

    var options = $.extend({}, instanceDefaultOptions, options),
        $el = $(el),
        $thumbnail,
        $videoWrapper,
        $video,
        youtubeId,
        isValid;

    init();

    var instanceApi = {
      el: el,
      $el: $el
    };
    return instanceApi;

    function init() {

      loadYoutubeApi();

      $thumbnail = $el.find('.thumbnail');
      $videoWrapper = $el.find('.video-wrapper');
      $video = $videoWrapper.find('.video');
      youtubeId = $el.data('youtube-id');
      isValid = calculateIsValid();

      if (!isValid) {
        return;
      }

      $thumbnail.
        click(function() {
          showVideo();
        });

    }

    function calculateIsValid()
    {
      return ($thumbnail.length > 0
        && $videoWrapper.length > 0
        && $video.length > 0
        && youtubeId !== undefined
      );
    }

    function showVideo()
    {

      var youtubePlayer = new YT.Player(
        $video.get(0),
        {
          width: '100%',
          height: '100%',
          videoId: youtubeId,
          events: {
            'onReady': function(event) {
              $thumbnail.hide();
              $videoWrapper.show();
              event.target.playVideo();
            }
          }
        }
      );

      return youtubePlayer;

    }

  }

  function loadYoutubeApi() {

    if (hasLoadedYoutubeApi) {
      return;
    }
    hasLoadedYoutubeApi = true;

    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";

    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    return globalApi;

  }

  //$.PLUGIN_NAME
  $[PLUGIN_NAME] = globalApi;

  //$('selector').PLUGIN_NAME()
  //Stores plugin instance within element.data(PLUGIN_NAME) and $[PLUGIN_NAME].instances
  $.fn[PLUGIN_NAME] = function(options) {
    return this.each(function() {
      var $this = $(this);
      if ($this.data(PLUGIN_NAME) === undefined) {
        var newPluginInstance = new pluginInstance(this, options);
        $this.data(PLUGIN_NAME, newPluginInstance);
        instances.push(newPluginInstance);
      }
    });
  };

})(jQuery);