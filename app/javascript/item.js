$(document).on('turbolinks:load', ()=> {
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${num}][src]"
                    id="item_images_attributes_${num}_src"><br>
                    <div class="js-remove">×</div>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;

    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();

  $('.image-file').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent('.js-file_group').data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    
    

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { 
      $('#previews').append(buildImg(targetIndex, blobUrl));
      $('.items__box--js').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('.image-file').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
 
  
    if ($('.js-file').length == 0) $('.image-file').append(buildFileField(fileIndex[0]));
  });
  
  });
