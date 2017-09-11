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
        var final = pickedurl.replace("files.myplaycity.com/files","files.myplaycity.com/files_downloader_temp/");
    document.getElementById("generatedurl").setAttribute("href",final);
    var x = document.getElementById('generatedurl');
    if (x.style.display === 'none') {
        x.style.display = '';
    } else {
        x.style.display = 'none';
    }
}