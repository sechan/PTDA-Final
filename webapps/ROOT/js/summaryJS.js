$(document).ready(function(){
  console.log("summary.js loaded.")

  // Variables needed to create a PDF of the summary
  var doc = new jsPDF();
  var specialElementHandlers = {
    '#editor': function(element, renderer) {
      return true;
    }
  };

  // Handlers for PDF export button
  $('#cmd').unbind("click");
  $('#cmd').click(function(){
    console.log("button clicked");

    doc.fromHTML($('#content').html(), 15, 15, {
      'width': 170, 'elementHandlers': specialElementHandlers
    });
	console.log("test");
    doc.save('summary.pdf');
    console.log("PDF created");
  });

  var templateParams = {
    name: 'Sean',
    notes: 'check this out'
  }

  // Handlers for sending an email button
  $('#email').unbind("click");
  $('#email').click(function(){
    console.log("Send email button clicked");
    console.log("Email sent!");
  });

  // Sends email using EmailJS
  document.getElementById('contact-form').addEventListener('submit', function(event) {
    console.log("Send button clicked!");
    event.preventDefault();
    this.contact_number.value = Math.random() * 100000 | 0;
    emailjs.sendForm('gmail', 'contact_form', this);
    console.log("email sent!");
  });


});