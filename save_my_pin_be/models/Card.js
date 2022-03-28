const mongoose = require('mongoose');
const  Schema = mongoose.Schema;

const cardSchema = new Schema({

    cardNumber: {
        type: String,
        required: true
    },
    expiryDate: {
        type:String,
        required: true
    },
    cardHolderName: {
        type: String, 
        required: true
    },
    cvvCode: {
        type: Number, 
        required: true, 
    },
    cardType:{
        type: String, 
        required: true, 
    },
    pinNo: {
        type: Number,
        required: true
    },
    owner: {
        type: Schema.Types.ObjectId, ref: 'User',
        required: true,
    }

})

const Card = mongoose.model("Card", cardSchema);
module.exports = Card;