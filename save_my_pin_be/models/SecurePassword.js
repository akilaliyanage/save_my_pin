const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const pwdSchema = new Schema({

    website: {
        type: String,
        required: true
    },
    username: {
        type:String,
        required: true
    },
    password: {
        type: String, 
        required: true
    },
    addedDate: {
        type: Date,
        required: true
    },
    user: {
        type: String,
        required: true
    }

})

const Password = mongoose.model("Password", pwdSchema);
module.exports = Password;