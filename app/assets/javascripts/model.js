// trigger by event
$('a.reveal-link').trigger('click');
$('a.close-reveal-modal').trigger('click');

// or directly on the modal
$('#myModal').foundation('reveal', 'open');
$('#myModal').foundation('reveal', 'close');
