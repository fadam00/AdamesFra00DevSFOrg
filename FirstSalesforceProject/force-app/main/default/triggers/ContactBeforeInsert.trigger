trigger ContactBeforeInsert on Contact (before insert) {
for(Contact contact:Trigger.new){
contact.description='Contact created by Frank';
}
}