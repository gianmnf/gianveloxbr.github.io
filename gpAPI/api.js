function getAppInfo(){
    let token = document.querySelector('#token');
    let packageName = document.querySelector('#pkgName');
    let finalURL = 'https://data.42matters.com/api/v2.0/android/apps/availability.json?p=' + packageName.value
    + '&access_token=' + token;

    $.getJSON(finalURL, function(data) {
        $.each(data.results, function(i, f) {
           var countriesAvaliable = "<ul>" + "<li>" + f.avaliable_in + "</li>" + "</ul>"
           var countriesNotAvaliable = "<ul>" + "<li>" + f.not_avaliable_in + "</li>" + "</ul>"
            $(countriesAvaliable).appendTo("#ca");
            $(countriesNotAvaliable).appendTo("#nca");
      });
    })
    
}