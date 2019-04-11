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
  // $('#cmd').unbind("click");
  // $('#cmd').click(function(){
  //   console.log("button clicked");
  //
  //   doc.fromHTML($('#content').html(), 15, 15, {
  //     'width': 170, 'elementHandlers': specialElementHandlers
  //   });
	// console.log($('#content').html());
  //   doc.save('summary.pdf');
  //   console.log("PDF created");
  // });


  // Exports text file of what's inside summary div
  function downloadInnerHtml(filename, elId, mimeType) {
    var elHtml = document.getElementById(elId).innerHTML;
    var link = document.createElement('a');
    mimeType = mimeType || 'text/plain';

    link.setAttribute('download', filename);
    link.setAttribute('href', 'data:' + mimeType + ';charset=utf-8,' + encodeURIComponent(elHtml));
    link.click();
  }

  // Name of the exported file, name can be changed here
  var fileName = 'summary.txt';


  // JQuery handlers for the export button
  $('#cmdTxt').click(function(){
    console.log("TXT Test Click");
  });
  $('#cmdTxt').unbind('click');
  $('#cmdTxt').click(function(){
    console.log('export to text has been clicked');
    downloadInnerHtml(fileName, 'main', 'text/html');
  });

});