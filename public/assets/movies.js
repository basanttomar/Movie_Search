
var app = window.app = {};
app.Movies = function() {
  this._input = $('#movies-search-txt');
  this._initAutocomplete();
};
app.Movies.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/movies/search',
        appendTo: '#movies-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      // '<span class="img">',
      //   '<img src="' + item.image_url + '" />',
      // '</span>',
      '<span class="name">' + item.name + '</span>',
      '<span class="language">' + item.language + '</span>',
      '<span class="country">' + item.country + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.name + ' - ' + ui.item.language);
    return false;
  }
};
