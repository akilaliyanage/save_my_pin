const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const userSchema = new Schema({

    username: {
        type: String,
        required: true
    },
    email: {
        type:String,
        required: function() { return this.userType === 'accountManager'; }
    },
    password: {
        type: String, 
        required: function() { return this.userType === 'accountManager'; }
    },
    accessCode: {
        type: String, 
        required: true, 
    },
    userType:{
        type: String, 
        required: true, 
    },
    group: {
        type: String,
        required: function() { return this.userType === 'member'; },
    }

})

const User = mongoose.model("User", userSchema);
module.exports = User;