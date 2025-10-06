trigger AccountTriggerToUpdatePhone on Account (after update) {
     
    if(trigger.isAfter && trigger.isUpdate)
    {
        AccountTriggerPhoneHandler.afterUpdate(trigger.new,trigger.oldMap);
    }
}