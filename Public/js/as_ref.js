!function(e,n){function o(e,n){document.cookie=e+"="+n+";path=/;"}function t(e){var n=document.cookie,o=n.indexOf(" "+e+"=");if(o==-1&&(o=n.indexOf(e+"=")),o==-1)n=null;else{o=n.indexOf("=",o)+1;var t=n.indexOf(";",o);t==-1&&(t=n.length),n=n.substring(o,t)}return n}var i=document.referrer.toLowerCase(),c=t("site_to_sendcloud");c&&i.search("sendcloud.sohu.com")!=-1||(i||(i=e.location.href),o("site_to_sendcloud",i))}(window);