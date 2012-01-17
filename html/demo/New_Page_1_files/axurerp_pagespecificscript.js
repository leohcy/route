
var PageName = 'New Page 1';
var PageId = 'p1a93ab77361e499eb636fbcf0a3254c0'
var PageUrl = 'New_Page_1.html'
document.title = 'New Page 1';

if (top.location != self.location)
{
	if (parent.HandleMainFrameChanged) {
		parent.HandleMainFrameChanged();
	}
}

if (window.OnLoad) OnLoad();
