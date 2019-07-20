const toggle = event => {

  const cardBody = $(event).parent().parent().parent().parent().find(".card-body");
  const arrowUp = $(event).find(".fa-chevron-up");
  const arrowDown = $(event).find(".fa-chevron-down");

  if(arrowUp.length){
    arrowUp.removeClass("fa-chevron-up").addClass("fa-chevron-down");
    cardBody.addClass("hidden");
  }

  if(arrowDown.length){
    arrowDown.removeClass("fa-chevron-down").addClass("fa-chevron-up");
    cardBody.removeClass("hidden");
  }
  
}
