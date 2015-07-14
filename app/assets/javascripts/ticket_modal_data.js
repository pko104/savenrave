$(function() {
$('#ticketModal').on('show.bs.modal', function (e) {
    $(this).find('.modal-body').html('Fired By: ' + e.relatedTarget.id);
});
});
