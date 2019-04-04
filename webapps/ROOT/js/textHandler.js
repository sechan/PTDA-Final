$(document).ready(function(){
    console.log("textHandler.js loaded");

    // Exports text file of what's inside summary div
    function downloadInnerHtml(filename, elId, mimeType) {
        var elHtml = document.getElementById(elId).innerHTML;
        var link = document.createElement('a');
        mimeType = mimeType || 'text/plain';

        var lines = elHtml.split("\n");

        //Loop through the file to remove html tags
        for(var line = 0; line < lines.length; line++){
            elHtml = elHtml.replace("<p>", " ");
            elHtml = elHtml.replace("</p>", " ");
            elHtml = elHtml.replace("<hr>", " ");
            elHtml = elHtml.replace("<p id=\"summaryTest\">", " ");
        }
        console.log(elHtml);

        link.setAttribute('download', filename);
        link.setAttribute('href', 'data:' + mimeType + ';charset=utf-8,' + encodeURIComponent(elHtml));
        link.click();
    }

    // Generates text for the email
    function exportEmail(filename, elId, mimeType) {
        var elHtml = document.getElementById(elId).innerHTML;
        var link = document.createElement('a');
        mimeType = mimeType || 'text/plain';

        var lines = elHtml.split("\n");

        //Loop through the file to remove html tags
        for(var line = 0; line < lines.length; line++){
            elHtml = elHtml.replace("<p>", " ");
            elHtml = elHtml.replace("</p>", " ");
            elHtml = elHtml.replace("<hr>", " ");
            elHtml = elHtml.replace("<p id=\"summaryTest\">", " ");
        }
        //console.log(elHtml);
        return elHtml;
    }

    var fileName =  'tags.txt'; // You can use the .txt extension if you want

    // Text button handler
    $('#cmdTxt').click(function(){
        downloadInnerHtml(fileName, 'content','text/html');
    });


    // Send email using EmailJS
    document.getElementById('contact-form').addEventListener('submit', function(event) {

        console.log("Send button clicked!");
        var emailContent = exportEmail(fileName, 'content','text/html');
        console.log(emailContent);
        $("#emailMessage").text(emailContent);

        event.preventDefault();
        this.contact_number.value = Math.random() * 100000 | 0;
        emailjs.sendForm('gmail', 'contact_form', this);
        console.log("email sent!");
    });
});