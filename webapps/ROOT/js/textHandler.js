// Up to date handlers for the summary page - summaryJS is still used for some older functions
$(document).ready(function(){
    console.log("textHandler.js loaded");

    // Creates and exports a text file of what's inside summary div
    function downloadInnerHtml(filename, elId, mimeType) {
        var elHtml = document.getElementById(elId).innerHTML;
        var link = document.createElement('a');
        mimeType = mimeType || 'text/plain';

        var lines = elHtml.split("\n");

        // Loop through the file to remove html tags
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

    // Generates text for the email - uses the same functionality of downloadInnerHtml but doesn't export to a text file
    // Returns the text store in a variable to be used in the email
    function exportEmail(filename, elId, mimeType) {
        var elHtml = document.getElementById(elId).innerHTML;
        var link = document.createElement('a');
        mimeType = mimeType || 'text/plain';

        var lines = elHtml.split("\n");

        // Loop through the file to remove html tags
        for(var line = 0; line < lines.length; line++){
            elHtml = elHtml.replace("<p>", " ");
            elHtml = elHtml.replace("</p>", " ");
            elHtml = elHtml.replace("<hr>", " ");
            elHtml = elHtml.replace("<p id=\"summaryTest\">", " ");
        }
        //console.log(elHtml);
        return elHtml;
    }

    var fileName =  'summary.txt'; // Change the name of the text file here

    // export the text file button handler
    $('#cmdTxt').click(function(){
        downloadInnerHtml(fileName, 'content','text/html');
    });

    // Send email from mcmasterptda@gmail.com using EmailJS
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