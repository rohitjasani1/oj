<?php
/**
 * Because customer add action happens in front, we must declare event handler in catalog package.
 */
class ControllerModuleSmshare extends Controller {
    
    /**
     * Kept only for update of core2 module to the 2.0.0 version.
     * 
     * Any save to the module setting, will remove the event and no more call will be done this listener.
     * The file can be then removed safely.
     * 
     * 24/03/2015
     * Delete me.
     *  
     */
    public function send_sms_on_new_order($data){
        
    }
}
?>