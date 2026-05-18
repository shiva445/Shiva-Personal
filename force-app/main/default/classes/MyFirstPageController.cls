public class MyFirstPageController {

    public String outputValueVariable{get;set;}
    
    //constructor
    public MyFirstPageController(){
        
        outputValueVariable='Yshu';
        
    }
    
    
    public void changename(){
        
        if(outputValueVariable=='Yshu'){
            outputValueVariable='Vaishnavi';
        }else{
            outputValueVariable='Yshu';
        }
        
        
    }

}