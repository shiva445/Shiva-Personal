({
  doInit: function(cmp){
    var action = cmp.get("c.getMyObjects");
    action.setCallback(this, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            cmp.set("v.MyObjects", response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
  }
})