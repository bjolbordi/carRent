/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	var path  = $('.ckeditor').attr('data-path');

    if(typeof path  !== "undefined")
    {
      path = '&path='+ path;
    }
    else
    {
    	path = '';
    }

	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	 //config.uiColor = '#00DC6E';
     //config.extraPlugins = 'filebrowser';
	 
     config.filebrowserBrowseUrl = ADMIN_URL +'editor/fileman/index.php';
     config.filebrowserImageBrowseUrl = ADMIN_URL +'editor/fileman/index.php?type=image';
     config.filebrowserFlashBrowseUrl = ADMIN_URL +'editor/fileman/index.php?type=flash';

     //config.filebrowserBrowseUrl = 'editor/file_browser/index.php?editor=ckeditor';
     //config.filebrowserImageBrowseUrl = 'editor/file_browser/index.php?editor=ckeditor&filter=image' + path;
     //config.filebrowserFlashBrowseUrl = 'editor/file_browser/index.php?editor=ckeditor&filter=flash' + path;

     // allow i tags to be empty (for FontAwesome)
     CKEDITOR.dtd.$removeEmpty['i'] = false;
     CKEDITOR.dtd.$removeEmpty['span'] = false;

	 config.font_names = 'Arial;Times New Roman;Verdana;Acadnusx';
	 config.language = 'en';
     config.allowedContent = true;
     config.enterMode = CKEDITOR.ENTER_BR;
     config.fillEmptyBlocks = false;
     config.tabSpaces = 0;
     config.basicEntities = false;
	 config.find_highlight = {
     element: 'span',
     styles: { 'background-color': '#ff0', color: '#00f' }
};
            

		
};
