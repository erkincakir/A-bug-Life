trigger AccountProcessor on Account (before insert, after insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            AccountProcessorHandler.handleBeforeInsert(Trigger.new);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            AccountProcessorHandler.handleAfterInsert(Trigger.new);
        }
        
    }
}