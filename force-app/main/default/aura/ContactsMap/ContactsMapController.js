({
	doInit : function(component, event, helper) {
        //console.log("Account id is "+component.get("v.recordId"));
		var action = component.get("c.getContactMarkers");
        
        action.setParams({  accId : component.get("v.recordId")  });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // set mapMarkersData attribute values with 'accountLocationWrapper' data 
                //console.log("response is "+JSON.stringify(response.getReturnValue()));
                var markerList = [];
                
                var markersReturned  = response.getReturnValue();
                
                
                var listLength = markersReturned.length;
                for (var i = 0; i < listLength; i++) {
                    
                    
                    console.log(markersReturned[i].title);
                }
                //component.set('v.mapMarkersData',markerList);
                component.set('v.mapMarkersData',response.getReturnValue());
                
                
                
                
                
            }
            
        });
        $A.enqueueAction(action);
	}
})