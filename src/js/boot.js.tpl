'use strict';
define([], function() {
    function addCSS(url) {
        var head = document.querySelector('head');
        var link = document.createElement('link');
        link.setAttribute('rel', 'stylesheet');
        link.setAttribute('type', 'text/css');
        link.setAttribute('href', url);
        head.appendChild(link);
    }

    function portraitHeader(el, split){
        //create new text headers
        var newHeader = document.createElement('div');
        newHeader.className = 'gv-title';
        newHeader.innerHTML = split[0];

        var newName = document.createElement('div');
        newName.className = 'gv-name';
        newName.innerHTML = split[1];

        //insert new header
        el.parentNode.insertBefore(newName, el.nextSibling);
        el.parentNode.insertBefore(newHeader, el.nextSibling);

        //remove old h2
        el.parentNode.removeChild(el);
    }

    function hospitalHeader(el){

        var newHeader = document.createElement('div');
        newHeader.className = 'gv-title-large';
        newHeader.innerHTML = el.innerHTML;

        el.parentNode.insertBefore(newHeader, el.nextSibling);

        //remove old h2
        el.parentNode.removeChild(el);
    }


    return {
        boot: function(el, context, config, mediator) {

            // Loading message while we fetch JS / CSS
            el.innerHTML = '<div style="font-size: 24px; text-align: center; padding: 72px 0; font-family: \'Guardian Egyptian Web\',Georgia,serif;">Loading…</div>';

            config = {
                'assetPath': '<%= assetPath %>'
            };

            // Load CSS asynchronously
            window.setTimeout(function() {
                addCSS('<%= assetPath %>/main.css');
            }, 10);


            var h2tags = document.querySelectorAll('.content__article-body h2, .article__body .prose h2');
            for(var i = 0; i < h2tags.length; i++){
                var el = h2tags[i];
                var text = el.innerHTML;
                console.log(text)
                var split = text.split(': ');

                if(split.length === 2){
                    portraitHeader(el, split);
                } else {
                    hospitalHeader(el);
                }

                
            }




        }


    };
});
