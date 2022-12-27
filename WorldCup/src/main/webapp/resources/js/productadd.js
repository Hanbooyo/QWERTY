  $('#colorChk').on('change',function(){
      if($(this).val()=='no'){
        $('#colorPickSpan').css('display','none');
  
        $('#addBtn').css('display','none');
      }else{
         $('#colorPickSpan').css('display','inline');
         $('#addBtn').css('display','inline');
      }
    });
    
    /////////////////////////////////////////
    
  var input;
  function openFile(event) {
      input = event.target;
      var reader = new FileReader();
      reader.onload = function(){
        var dataURL = reader.result;
        $(input).next().children('img').attr('src',dataURL);
       $(input).next().children('img').css('display','block');
      }
       reader.readAsDataURL(input.files[0]);
    };
    
  function removeBox(event){
    $(event.target).parents('.colorImgBox').remove();
    event.preventDefault();
  }
    