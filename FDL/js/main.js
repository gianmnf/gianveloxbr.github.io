function gfoolsgenerator() {
    var pickedurl = document.getElementById('pickedurl').value;
    var first = pickedurl.replace("installers","games");
    var final = first.replace("Installer", "");
    document.getElementById("generatedurl").setAttribute("href",final);
    var x = document.getElementById('generatedurl');
    if (x.style.display === 'none') {
        x.style.display = '';
    } else {
        x.style.display = 'none';
    }
}

function mpcgenerator() {
    var pickedurl = document.getElementById('pickedurl').value;
    var final = pickedurl.replace("files.myplaycity.com/files","files.myplaycity.com/files_downloader_temp");
    document.getElementById("generatedurl").setAttribute("href",final);
    var x = document.getElementById('generatedurl');
    if (x.style.display === 'none') {
        x.style.display = '';
    } else {
        x.style.display = 'none';
    }
}

function iwingenerator() {
    var pickedurl = document.getElementById('pickedurl').value;
    var str = pickedurl.replace("stamp.iwin.com/games/v2/","download.iwincdn.com/gg/pf/iwin/");
    i = 78,
    first = str.substr(0, i-19)+str.substring(i);
    var second = first.replace("temp", "acd_60m_pogoiwin/iwin");
    document.getElementById("generatedurl").setAttribute("href",second);
    var x = document.getElementById('generatedurl');
    if (x.style.display === 'none') {
        x.style.display = '';
    } else {
        x.style.display = 'none';
    }
}