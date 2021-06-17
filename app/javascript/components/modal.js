const initModal = () => {
  $('#dateModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var title = button.data('game') // Extract info from data-* attributes
    var game = button.data('gameId') // Extract info from data-* attributes
    var user = button.data('userId') // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    console.log(game, user);
    modal.find('.modal-title').text(title)
    console.log(modal.find('.modal-title'));
    console.log(modal.find('.game-id'));
    console.log(modal.find('.user-id'));
    modal.find('.game-id').val(game);
    modal.find('.user-id').val(user);
  });
}

export { initModal };