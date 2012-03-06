//This code makes the th tag clickable and looks at the data-link tag we set for the url
$(document).ready(function()
{
	$('.multiSort').click(function()
	{
		window.location.href = $(this).data('link');
	});
});