// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function foo(a,b,c,d,e) {
  console.log(a.originalEvent.fpfiles[0])
  $("#uploadFinished").text("upload has finished").show()
};
$(function(){
  // $("#document_filepicker_url").change(foo)
  // filepicker.setKey = 'AuHpQGwSCWmZPeeoHTdigz'
  $('#ajaxUpload').change(function(){
    var output = $("#uploadFinished").show();
    filepicker.store(this, {location: 'S3'}, function(InkBlob){
        $("#document_filepicker_url").val(InkBlob.url)
        output.html('Uploaded: '+InkBlob.filename+'');
    }, function(fperror){
        output.text(fperror.toString());
    }, function(progress){
        output.text("Uploading... ("+progress+"%)");
    });
});
})
