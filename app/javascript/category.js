
function appendOption(category) {
  let html = 
    `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
  return html;
}

function appendChildrenBox(insertHTML) {
  let childSelectHtml = '';
  childSelectHtml = 
    `<select class="item_input__body__category__children--select" id="children_category">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}</select>`;
  $('#children_box').append(childSelectHtml);
}

function appendGrandchildrenBox(insertHTML) {
  let grandchildSelectHtml = '';
  grandchildSelectHtml = 
    `<select class="item_input__body__category__grandchildren--select" id="grandchildren_category" name="item[category_id]">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}</select></i>`;
  $('#grandchildren_box').append(grandchildSelectHtml);
}

$(document).on("change","#parent_category", function() {
  let parentCategory =  $("#parent_category").val();

  if (parentCategory != "") {
    $.ajax( {
      type: 'GET',
      url: 'get_category_children',
      data: { parent_name: parentCategory },
      dataType: 'json'
    })
    .done(function(children) {
      $("#children_box").empty();
      $("#grandchildren_box").empty();
      let insertHTML = '';
      children.forEach(function(child) {
        insertHTML += appendOption(child);
      });
      appendChildrenBox(insertHTML);
    })
    .fail(function() {
      alert('error：取得に失敗');
    })
  }else{
    $("#children_box").empty();
    $("#grandchildren_box").empty();
  }
});

$(document).on('change', '#children_box', function() {
  let childId = $('#children_category option:selected').data('category');
  if (childId != ""){
    $.ajax({
      url: 'get_category_grandchildren',
      type: 'GET',
      data: { child_id: childId },
      datatype: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $("#grandchildren_box").empty();
        let insertHTML = '';
        grandchildren.forEach(function(grandchild) {
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      }
    })
    .fail(function() {
      alert('error:取得に失敗');
    })
  }else{
    $("#grandchildren_box").empty();    
  }
});

$(document).on('change', '#child_box', function() {
  let childId = $('#child_category option:selected').data('category');
  if (childId != ""){
    $.ajax({
      url: 'get_category_grandchildren',
      type: 'GET',
      data: { child_id: childId },
      datatype: 'json'
    })
    .done(function(grandchildren) {
      if (grandchildren.length != 0) {
        $("#grandchildren_box").empty();
        let insertHTML = '';
        grandchildren.forEach(function(grandchild) {
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      }
    })
    .fail(function() {
      alert('error:取得に失敗');
    })
  }else{
    $("#grandchildren_box").empty();    
  }
});