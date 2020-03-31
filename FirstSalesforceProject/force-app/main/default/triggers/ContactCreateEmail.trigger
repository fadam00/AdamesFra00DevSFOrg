trigger ContactCreateEmail on Contact (before insert) {
    for (Contact c:Trigger.new){
        c.Email = 'hello@world.com';
    }
}